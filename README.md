# 🧪 ECS Schema Validator Microservice

This project is a Python-based microservice deployed on **AWS ECS Fargate** to validate uploaded data files against defined schemas. It is part of a **monolith-to-microservices** migration strategy, enabling independent scaling, secure config, and modular orchestration.

---

## 🚀 Features

- ✅ **FastAPI-based** schema validator service
- 🔐 **AWS Secrets Manager** for managing sensitive configuration
- ☁️ **ECS Fargate** for serverless containerized deployment
- 🏗️ **Terraform modules** for infrastructure as code (IaC)
- 🔄 **Step Functions** for orchestrating downstream actions
- 📦 **GitHub Actions** for CI/CD automation
- 🔍 **Integration & security testing** with mocks (SNS, IAM, oversized payloads)

---

## 📁 Project Structure

```
ecs-schema-validator-microservice/
├── app/               # FastAPI microservice code
├── tests/             # Unit, integration, and security test cases
├── infra/         # ECS, ALB, IAM, Secrets, Step Functions
├── scripts/           # Optional CLI scripts
├── .github/workflows/ # GitHub Actions deployment pipeline
├── Dockerfile         # Container image definition
├── requirements.txt   # Python dependencies
├── .env.example       # Sample environment config
└── README.md          # You're here!
```

---

## 🛠️ Technologies Used

| Area               | Tools/Services |
|--------------------|----------------|
| API Framework      | FastAPI        |
| Container Runtime  | Docker         |
| Orchestration      | AWS ECS Fargate, Step Functions |
| Configuration      | AWS Secrets Manager |
| CI/CD              | GitHub Actions |
| Infrastructure     | Terraform      |
| Testing            | Pytest, Moto   |

---

## ⚙️ Setup Instructions

### 1. Clone the Repo

```bash
git clone https://github.com/your-org/ecs-schema-validator-microservice.git
cd ecs-schema-validator-microservice
```

### 2. Build Docker Image

```bash
docker build -t schema-validator .
```

### 3. Run Locally (Dev Mode)

```bash
uvicorn app.main:app --reload
```

### 4. Run Tests

```bash
pip install -r requirements.txt
pytest
```

### 5. Deploy with Terraform

```bash
cd terraform
terraform init
terraform plan -var="env=dev"
terraform apply -var="env=dev"
```

---

## 🧪 Testing Strategy

| Type          | Description                                |
|---------------|--------------------------------------------|
| Unit Tests    | Validate schema logic and response payload |
| Integration   | Mocks AWS services like SNS/Secrets Manager |
| Security      | Injects oversized payloads, tests IAM perms|

---

## 🔒 Secrets Management

Secrets (e.g., API keys, DB credentials) are stored in **AWS Secrets Manager** and securely injected into ECS containers via environment variables and IAM-scoped policies.

---

## 🧩 Extending the Microservice

- Add new schema versions in `validator.py`
- Trigger different downstream events via `events.py`
- Define Step Functions orchestration logic in Terraform

---

## 🧠 STAR Project Highlights

- 🌱 Monolith decomposition
- 🔐 Secure by design
- 📦 GitOps via GitHub Actions
- 🧪 Robust test automation
- 🤝 Enabled cross-team ownership with reusable templates

---

## 📄 License

MIT License © 2025