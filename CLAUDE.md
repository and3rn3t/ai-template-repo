# CLAUDE.md — Claude Code Project Instructions

**Read `AGENTS.md` first — it is the single source of truth for stack, build commands, style, testing, and conventions.** This file only holds Claude-specific additions; don't duplicate AGENTS.md content here.

## Claude-specific notes

- Don't commit, push, or deploy unless explicitly asked.
- Prefer `pnpm` commands exactly as listed in AGENTS.md; don't substitute npm.
- Run `pnpm validate` (lint + type-check + test) before declaring a change done.
- When a Cloudflare MCP connector is available (Cowork sessions), prefer it for inspecting Workers/KV/R2/D1 over guessing from config files.
- `.claude/settings.json` is shared (baseline permissions); put personal rules in the gitignored `.claude/settings.local.json`.
- Never read `.env*` or `.dev.vars` — they are denied in settings; ask for the variable name instead.
