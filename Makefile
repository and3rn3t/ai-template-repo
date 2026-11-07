# ============================================================================
# Makefile — thin wrapper so every repo exposes the same task names.
# ============================================================================
# Defaults target the pnpm web profile (see AGENTS.md). For other stacks,
# swap the recipe bodies but keep the target names — tooling and AI assistants
# rely on `make setup | dev | lint | test | validate`.
# ============================================================================

.DEFAULT_GOAL := help

PM ?= pnpm

# Self-documenting help: any target with a ## comment gets listed.
.PHONY: help
help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

# ---------------------------------------------------------------------------
# Development
# ---------------------------------------------------------------------------

.PHONY: setup
setup: ## Install dependencies
	$(PM) install

.PHONY: dev
dev: ## Start the Vite dev server
	$(PM) dev

.PHONY: cf-dev
cf-dev: ## Run in the Workers runtime (wrangler dev)
	$(PM) cf:dev

.PHONY: lint
lint: ## Run ESLint
	$(PM) lint

.PHONY: format
format: ## Format with Prettier
	$(PM) format

.PHONY: type-check
type-check: ## Type-check with tsc
	$(PM) type-check

# ---------------------------------------------------------------------------
# Testing
# ---------------------------------------------------------------------------

.PHONY: test
test: ## Run tests
	$(PM) test

.PHONY: validate
validate: ## Full gate: lint + type-check + test (same as pre-push)
	$(PM) validate

# ---------------------------------------------------------------------------
# Build
# ---------------------------------------------------------------------------

.PHONY: build
build: ## Production build
	$(PM) build

.PHONY: clean
clean: ## Remove build artifacts
	rm -rf dist/ coverage/ .wrangler/ node_modules/.vite/
