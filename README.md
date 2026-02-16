## Azure Terraform LabsHands‑on Infrastructure as Code (IaC) labs for Microsoft Azure using Terraform

This repo is structured like a real‑world DevOps/Platform project to showcase:- Reusable **Terraform modules** (VNet, Storage Account, Log Analytics)- Clear **environments** (starting with `dev`)- A clean path toward **remote backend**, **CI/CD (GitHub Actions)**, and **AKS/GitOps** later> Goal: build demonstrable, production‑style IaC skills for an Azure‑centric DevOps/Platform Engineer role.---

## 📦 Repo StructureShow

```
.
├── .gitignore
├── modules/
│   ├── vnet/
│   ├── storage/
│   └── log-analytics/
└── environments/
└── dev/
├── providers.tf
├── main.tf
├── variables.tf
└── terraform.tfvars   (gitignored if used)
```

> NOTE: local `.terraform/` folders and any `*.tfstate` files must never be committed.

---

### ✅ What `dev` environment deploys

- **Resource Group** (`rg-labs-core`)
- **Virtual Network** + **Subnet**
- **Log Analytics Workspace**
- **Storage Account** (unique global name via `random_integer`)

All resources are deployed via **modules** for composability and testability.

---

### 🚀 Local Workflow
 
0) Prereqs
- **Azure CLI** installed:
  - macOS: `brew install azure-cli`
  - Linux (Debian/Ubuntu): `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`
  - Windows: MSI from https://aka.ms/installazurecliwindows
- Auth:
  ```bash
  az login
  az account show
  # (optional) select subscription:
  # az account set --subscription "<SUBSCRIPTION_ID_OR_NAME>"

1) Init & Plan
Shellcd environments/devterraform init    # or: terraform init -upgradeterraform planShow more lines
2) Apply (create infra)
Shellterraform apply# type: yesShow more lines
3) Validate in Azure Portal

Resource group, VNet/Subnet, Log Analytics, Storage account should exist
Costs: Cost Management → monthly budget $15–$20 for lab safety

4) Destroy (cost‑safe lab practice)
Shellterraform destroy# type: yesShow more lines

For learning, apply → validate → destroy is recommended to avoid unexpected costs.

### 🔐 Security & Cost

Never commit:

.terraform/, *.tfstate, *.tfvars, .terraform.lock.hcl (early stage)


Use Azure CLI auth locally (no hardcoded credentials)
Keep Basic SKU resources where possible and delete after lab
Set an Azure Budget (e.g., $15–$20) with alerts

### 🧩 Next Steps (Roadmap)

Remote backend (Azure Storage):

Storage Account + container tfstate
Configure backend in environments/dev/backend.tf (or terraform { backend "azurerm" { ... } })

### CI/CD with GitHub Actions

Workflow: fmt → init → validate → plan on PRs
apply on main with manual approval

### Networking deep dive

second VNet + VNet peering, NSG, NSG flow logs
Private Endpoint for Storage

### AKS & GitOps (later)

AKS cluster → Helm → Argo CD
Observability: Prometheus/Grafana via Helm

### Policies & Governance

Azure Policy (allowed locations, required tags)
Management Groups, budget guardrails

### 👤 Author

Yurii Chahovets — IT System Administrator → Azure‑centric DevOps/Platform Engineer (in progress).
Seeking remote roles, focusing on IaC, CI/CD, AKS, Observability, Governance.
