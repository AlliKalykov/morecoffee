# Makefile for managing Coffee Bot

# Variables
VENV = .venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip

# Create virtual environment
venv:
    python3 -m venv $(VENV)

# Install dependencies
install: venv
    $(PIP) install -r requirements.txt
    pre-commit install

# Run the bot
run-bot: install
    $(PYTHON) bot/main.py

# Run the web app
run-web: install
    $(PYTHON) web/app.py

# Run tests
test:
    $(PYTHON) -m unittest discover tests

# Format code with Black and isort
format:
    pre-commit run --all-files

# Check types with mypy
type-check:
    pre-commit run mypy --all-files

.PHONY: venv install run-bot run-web test format type-check
