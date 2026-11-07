---
name: project-setup
description: 'Set up a new and3rn3t repo or bring an existing one up to the baseline — scaffolding, CI, linting, hooks, AI instruction files. Use when initializing a project, adding CI/CD, configuring ESLint/Prettier/Vitest, or adopting the ai-template-repo baseline.'
argument-hint: 'Repo name and type (web | python), or the existing repo to align'
---

# Project Setup Workflow

The baseline lives in `ai-template-repo`: shared files at its root, stack files in
`profiles/web/` (React + TS + Vite + Workers) and `profiles/python/`. Don't invent
new layouts or configs — copy from there.

## New repo

1. From the workspace root: `make new-repo NAME=<name> TYPE=node|python` (dry run),
   then `node tools/new-repo.mjs <name> --type=<type> --apply`.
2. Replace `replace-project-name` (web: `package.json`, `wrangler.jsonc`, `index.html`, `src/App.tsx`).
3. Fill in the **Project Overview** in `AGENTS.md`. Leave `CLAUDE.md` as a pointer.
4. Web: `pnpm install && pnpm validate && pnpm build`. Python: `pip install -e ".[dev]" && pytest`,
   then `pre-commit install --hook-type commit-msg`.
5. `make sync REPO=<name>` must report nothing missing; `make workspace-init` adds it to `workspace.json`.

## Existing repo

1. `make sync REPO=<name>` → `make sync-apply REPO=<name>` creates missing baseline files (never overwrites).
2. `make drift REPO=<name>` → reconcile by hand, or bless intentional variants in `.consistency-ignore`.
3. Web configs: extend `@and3rn3t/eslint-config` instead of local rule copies (see `profiles/web/README.md`).

## Done when

- `pnpm validate` (or `pytest`) passes locally and CI is green
- `make sync` / `make drift` show nothing unexpected for the repo
- `AGENTS.md` describes the project; no `replace-project-name` placeholders remain
