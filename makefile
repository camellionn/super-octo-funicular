.PHONY: all install build lint help

help: ## Display this help screen
	@echo "Usage: make [target] [ARGUMENTS]"
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

PROJECT_DIR=project
NPM_BIN=npm

# Default target (runs if `make` is invoked with no arguments)
all: install build lint


install: ## Target to install dependencies
	@echo "Installing dependencies..."
	cd $(PROJECT_DIR) && $(NPM_BIN) install


build: ## Target to build the project
	@echo "Building the project..."
	cd $(PROJECT_DIR) && $(NPM_BIN) run build


lint: ## Target to lint the project
	@echo "Running linter..."
	cd $(PROJECT_DIR) && $(NPM_BIN) run lint
	

