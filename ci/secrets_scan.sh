#!/usr/bin/env bash
set -e
echo "=== Gitleaks: поиск секретов в коде ==="
docker build -f Dockerfile.ci -t bubblepop-ci .
docker run --rm bubblepop-ci gitleaks detect --source /src --no-git -v
echo "Gitleaks: секретов не найдено"
