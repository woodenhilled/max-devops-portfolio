# DevOps Portfolio Project

A full-stack DevOps demonstration project featuring a Python Flask API with a complete CI/CD pipeline, container orchestration, infrastructure-as-code, and monitoring stack.

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Application | Python 3.11, Flask |
| Containerization | Docker, Docker Compose |
| CI/CD | GitHub Actions |
| Container Registry | Tencent Cloud TCR |
| Infrastructure | Terraform, Tencent Cloud (CVM, VPC) |
| Monitoring | Prometheus, Grafana |

## API Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/` | Returns service info |
| GET | `/health` | Health check endpoint |

## Local Development

### Prerequisites

- Python 3.11+
- Docker & Docker Compose (optional)

### Run with Python

```bash
# Clone the repository
git clone https://github.com/<your-username>/devops-portfolio.git
cd devops-portfolio

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate  # macOS/Linux

# Install dependencies
pip install -r requirements.txt

# Start the app
python app.py
```

The service will be available at http://localhost:8080

### Run with Docker Compose

```bash
docker compose up
```

The service will be available at http://localhost:8080

## Project Structure

```
devops-portfolio/
├── app.py                  # Flask application
├── test_app.py             # Unit tests
├── requirements.txt        # Python dependencies
├── Dockerfile              # Container image definition
├── docker-compose.yml      # Local multi-container setup
├── terraform/              # Infrastructure as Code
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── .github/
    └── workflows/
        └── ci.yml          # CI/CD pipeline
```

## CI/CD Pipeline

Every push to `main` triggers the following pipeline:

1. **Test** — run unit tests with pytest
2. **Build** — build Docker image
3. **Push** — push image to Tencent Cloud TCR
4. **Deploy** — SSH into CVM and pull the latest image

## Infrastructure

All cloud resources are managed with Terraform:

- **VPC** with a public subnet
- **Security Group** allowing ports 22 (SSH), 8080 (app), 9090 (Prometheus), 3000 (Grafana)
- **CVM instance** (Tencent Cloud) running Docker

## Monitoring

Prometheus scrapes metrics from the Flask app every 15 seconds. Grafana provides dashboards and alerting.

Access after deployment:
- App: `http://<cvm-ip>:8080`
- Grafana: `http://<cvm-ip>:3000`
- Prometheus: `http://<cvm-ip>:9090`
