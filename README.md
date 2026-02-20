# CI/CD Pipeline – Flask + Docker + GitHub Actions + Kubernetes (kind)

Automated CI/CD pipeline that runs lint + tests, builds and security-scans a Docker image (Trivy), and pushes it to Docker Hub on every push to `main`. After CI succeeds, CD deploys the image to a temporary Kubernetes cluster (kind) using Helm and verifies the rollout with smoke tests (`/health`, `/version`).
