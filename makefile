# Variables
PROJECT_DIR=project
NPM_BIN=npm  # Use the npm command directly

# Default target (runs if `make` is invoked with no arguments)
all: install build lint

# Target to install dependencies
install:
	@echo "Installing dependencies..."
	cd $(PROJECT_DIR) && $(NPM_BIN) install

# Target to build the project
build:
	@echo "Building the project..."
	cd $(PROJECT_DIR) && $(NPM_BIN) run build

# Target to lint the project
lint:
	@echo "Running linter..."
	cd $(PROJECT_DIR) && $(NPM_BIN) run lint

# Target to display help
help:
	@echo "Available targets:"
	@echo "  all       Install dependencies, build, and lint"
	@echo "  install   Install dependencies"
	@echo "  build     Build the project"
	@echo "  lint      Run linter"
