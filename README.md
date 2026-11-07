# ai-template-repo

**The baseline every and3rn3t repo starts from and is measured against: AI-assistant instructions, CI, git hooks, community files and a working React + Vite + Cloudflare Workers starter.**

[![Template check](https://github.com/and3rn3t/ai-template-repo/actions/workflows/template-check.yml/badge.svg)](https://github.com/and3rn3t/ai-template-repo/actions/workflows/template-check.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Features

- **One instruction source**: `AGENTS.md` holds the rules. `CLAUDE.md`, Copilot and Cursor files only point to it.
- **Claude Code ready**: shared permissions, a format-on-edit hook and project skills in `.claude/`
- **Copilot extras**: file-scoped instructions, prompts and agents in `.github/`
- **CI out of the box**: pnpm quality pipeline, CodeQL, dependency review, gitleaks, actionlint, consistency guard
- **Git hygiene**: commitlint, lint-staged and a pre-push `pnpm validate` gate (husky)
- **Release flow**: release-drafter with conventional-commit autolabels, Renovate via the shared preset
- **Stack profiles**: `profiles/web` (tested starter) and `profiles/python`
- **Self-checked**: `template-check.yml` lints the baseline and builds the web starter on every PR

## Getting started

### New repo (preferred)

From the workspace root (`GitHub.nosync/`):

```bash
make new-repo NAME=my-app TYPE=node          # dry run: lists files
node tools/new-repo.mjs my-app --type=node --apply
cd my-app && pnpm install && pnpm validate
```

This copies the root baseline plus the matching profile, then runs `git init`. Afterwards, replace `replace-project-name` and fill in the Project Overview in `AGENTS.md`.

### Or: GitHub "Use this template"

You get every file, including both profiles. Copy `profiles/web/*` (or `profiles/python/*`) to the root, delete `profiles/`, then do the same placeholder and AGENTS.md steps.

### Existing repo

```bash
make sync REPO=my-repo        # what's missing (dry run)
make sync-apply REPO=my-repo  # create missing files, never overwrites
make drift REPO=my-repo       # files that exist but differ from this template
```

## Tech stack

React 19 · TypeScript 6 · Vite 8 · Vitest 5 · ESLint 10 (`@and3rn3t/eslint-config`) · Prettier 3 · pnpm 11 · Node 24 · Cloudflare Workers (wrangler 4)

## What's in here

| Area            | Files                                                                                                                                                           |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AI instructions | `AGENTS.md` (source of truth), `CLAUDE.md`, `.github/copilot-instructions.md`, `.cursor/rules/project.mdc`                                                      |
| Claude Code     | `.claude/settings.json` (permissions + hook), `.claude/hooks/`, `.claude/skills/` (also loaded by VS Code Copilot)                                              |
| Copilot         | `.github/instructions/` (file-scoped), `.github/prompts/`, `.github/agents/`, `.github/hooks/`                                                                  |
| CI / automation | `.github/workflows/`: ci, codeql, dependency-review, gitleaks, actionlint, consistency, labeler, label-sync, release-drafter, stale, lighthouse (disabled stub) |
| Git hooks       | `.husky/` (commit-msg, pre-commit, pre-push), `commitlint.config.mjs`, `.lintstagedrc.json`                                                                     |
| Community       | `LICENSE`, `SECURITY.md`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `CHANGELOG.md`, issue/PR templates, `CODEOWNERS`, labels                                     |
| Editor / env    | `.editorconfig`, `.gitattributes`, `.vscode/`, `.devcontainer/`, `.nvmrc`, `.env.example`, `.dev.vars.example`, `Makefile`                                      |
| Profiles        | `profiles/web/` (package.json, vite, wrangler.jsonc, eslint/prettier/tsconfig, src), `profiles/python/` (ci, codeql, pre-commit, renovate)                      |
| Docs            | `docs/README-STANDARD.md` (scored README shape), README/ARCHITECTURE/PRD/ROADMAP/ADR templates, `docs/AI-CUSTOMIZATION-GUIDE.md`                                |

## How baseline changes reach other repos

The workspace tooling (`tools/lib/manifest.mjs`) reads managed files from this repo.

1. Change the file here, then merge.
2. `make drift`: every repo that now differs is listed.
3. `make sync-update FILE=<path>` (dry run), then `make sync-update-apply FILE=<path>`: overwrites drifted copies of that one file. Files a repo blesses in `.consistency-ignore` are skipped.
4. New files reach repos through `make sync-apply`, which never overwrites existing files.

Files that are deliberately repo-specific (`AGENTS.md`, `ci.yml`, ESLint/tsconfig) are never synced after creation. See `tools/README.md` → _Managed files_.

## License

MIT — see [LICENSE](LICENSE).
