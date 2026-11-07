# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Baseline overhaul: this repo is now the single source for every managed baseline file.

### Added

- `profiles/web/`: working React 19 + Vite 8 + Vitest 5 + Workers starter (package.json on pnpm 11, pnpm-workspace.yaml, wrangler.jsonc with static assets + SPA fallback; ESLint, Prettier and tsconfig all from `@and3rn3t/eslint-config@^0.4.0`)
- `profiles/python/`: ci, codeql, pre-commit and renovate files (moved from `tools/templates/python`)
- consistency, gitleaks and actionlint workflows (were only in `.github/workflow-templates`)
- `template-check.yml`: Prettier, JSON, pointer, TODO and hook checks, plus an install/validate/build of the web starter
- `.claude/hooks/format-edited-file.sh` PostToolUse hook; `.dev.vars.example`
- release-drafter autolabeler from conventional-commit titles; `breaking` and `chore` labels
- AGENTS.md Definition of Done and `pnpm validate` gate

### Changed

- pnpm-first everywhere: ci.yml, husky hooks, Makefile (real targets), CONTRIBUTING
- Skills moved to `.claude/skills/` (read by Claude Code and VS Code Copilot); testing patterns use Vitest
- All md/yml/json formatted with the shared Prettier base, which removes formatting-only drift across repos
- stale.yml now calls the shared reusable workflow; `.github/CODEOWNERS` matches the shipped baseline
- README rewritten: how to start a repo and how baseline changes propagate
- VS Code recommendations and devcontainer target Node 24 + pnpm + Claude Code

### Removed

- `.cursorrules`, `.clinerules`, `.windsurfrules` (tools read AGENTS.md natively), root `CODEOWNERS`, `release.yml`
- Copied eslint/prettier/tsconfig and Pages-style `wrangler.toml` in `profiles/web`

### Fixed

- CODE_OF_CONDUCT contact email, private vulnerability link in issue `config.yml`, `.gitignore` covers `.dev.vars` / `.wrangler/` / `settings.local.json`

## [0.1.0] - 2026-03-26

### Added

- Initial template: AGENTS.md single-source pattern, Copilot instructions/prompts/agents/skills, community files, quality CI, Renovate, commitlint + husky, doc scaffolds
