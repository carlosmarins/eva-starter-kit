#!/usr/bin/env bash
# provision-gcp.sh — cria a infra da Eva na Google Cloud (rode no Cloud Shell do projeto da pessoa).
# Edite PROJECT para o ID do projeto dela. Depois, dentro da VM, rode install-eva.sh.
set -euo pipefail
PROJECT="${1:-SEU_PROJETO_GCP}"     # passe como argumento ou edite aqui
ZONE="${2:-us-central1-a}"
MACHINE="${3:-e2-standard-4}"        # 4 vCPU/16GB; use e2-standard-8 p/ mais folga
SA="eva-agent"
SA_EMAIL="${SA}@${PROJECT}.iam.gserviceaccount.com"

echo "[gcp] habilitando APIs…"
gcloud services enable compute.googleapis.com aiplatform.googleapis.com \
  generativelanguage.googleapis.com apikeys.googleapis.com iam.googleapis.com --project="$PROJECT"

echo "[gcp] service account + papéis (Vertex/Gemini + leitura BigQuery)…"
gcloud iam service-accounts create "$SA" --project="$PROJECT" --display-name="Eva Agent VM" || true
for ROLE in roles/aiplatform.user roles/bigquery.jobUser roles/bigquery.dataViewer; do
  gcloud projects add-iam-policy-binding "$PROJECT" --member="serviceAccount:${SA_EMAIL}" --role="$ROLE" --condition=None
done
# actAs em si mesma (necessário p/ a VM tirar snapshot de manutenção via API)
gcloud iam service-accounts add-iam-policy-binding "$SA_EMAIL" --project="$PROJECT" \
  --member="serviceAccount:${SA_EMAIL}" --role="roles/iam.serviceAccountUser" || true

echo "[gcp] chave Gemini (chat + embeddings, keyless p/ a pessoa)…"
gcloud services api-keys create --project="$PROJECT" --display-name="eva-gemini" \
  --api-target=service=generativelanguage.googleapis.com || true
echo "  → pegue a string: gcloud services api-keys get-key-string <KEY_NAME> --format='value(keyString)'"

echo "[gcp] criando a VM…"
gcloud compute instances create eva --project="$PROJECT" --zone="$ZONE" \
  --machine-type="$MACHINE" \
  --image-family=ubuntu-2404-lts-amd64 --image-project=ubuntu-os-cloud \
  --boot-disk-size=100GB --boot-disk-type=pd-ssd \
  --service-account="$SA_EMAIL" --scopes=cloud-platform --tags=eva

echo "[gcp] snapshot diário do disco (DR)…"
gcloud compute resource-policies create snapshot-schedule eva-daily --project="$PROJECT" \
  --region="${ZONE%-*}" --max-retention-days=14 --daily-schedule --start-time=06:00 \
  --on-source-disk-delete=keep-auto-snapshots || true
gcloud compute disks add-resource-policies eva --zone="$ZONE" --project="$PROJECT" --resource-policies=eva-daily || true

cat <<NEXT

✅ Infra criada. Agora entre na VM e instale a Eva (o install-eva.sh é baixado do GitHub na hora,
   porque ele não está na VM):
  gcloud compute ssh eva --zone=$ZONE --project=$PROJECT
  # dentro da VM, cole esta linha única:
  curl -fsSL https://raw.githubusercontent.com/carlosmarins/eva-starter-kit/main/install/install-eva.sh | sudo bash
NEXT
