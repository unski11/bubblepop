#!/usr/bin/env bash
set -e
echo "=== Сборка CI-образа с анализаторами ==="
docker build -f Dockerfile.ci -t bubblepop-ci .
echo "=== Bandit: полный отчёт по всем уровням ==="
docker run --rm bubblepop-ci bandit -r app || true
echo "=== Bandit: блокирующая проверка (падаем на HIGH) ==="
docker run --rm bubblepop-ci bandit -r app --severity-level high
echo "Bandit: уязвимостей уровня HIGH не найдено"
