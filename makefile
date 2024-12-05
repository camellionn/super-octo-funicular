.PHONY: all install build dev lint help

help: ## Display this help screen
	@echo "Usage: make [target] [ARGUMENTS]"
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

FRONTEND_DIR=project
BACKEND_DIR=backend
NPM_BIN=npm

# Default target (runs if `make` is invoked with no arguments)
all: install build lint


install: ## Target to install dependencies
	@echo "Installing dependencies..."
	cd $(FRONTEND_DIR) && $(NPM_BIN) install
	cd $(BACKEND_DIR) && $(NPM_BIN) install


build: ## Target to build the project
	@echo "Building the project..."
	cd $(FRONTEND_DIR) && $(NPM_BIN) run build

dev: ## Starts local dev
	cd $(BACKEND_DIR) && $(NPM_BIN) run dev


lint: ## Target to lint the project
	@echo "Running linter..."
	cd $(FRONTEND_DIR) && $(NPM_BIN) run lint
	cd $(BACKEND_DIR) && $(NPM_BIN) run lint
