# Project Guidelines (AGENTS.md)

<!--
  SINGLE SOURCE OF TRUTH for AI assistant instructions.
  CLAUDE.md and .github/copilot-instructions.md are thin pointers to this file —
  edit HERE, not there. (Claude Code, Copilot, Cursor, and most agents all read
  AGENTS.md natively or via the pointer files.)

  AGENTS.md supports hierarchy in monorepos:
    /AGENTS.md              - Root defaults
    /apps/web/AGENTS.md     - App-specific (overrides root for that subtree)
-->

## Project Overview

<!-- Describe your project here: what it does, who it's for. -->

## Stack

- React + TypeScript + Vite; deployed to Cloudflare Workers (static assets) via wrangler
- Package manager: **pnpm** (version pinned in `package.json` `packageManager`; never mix with npm)
- Node: `>=24` (pinned in `.nvmrc`)
- Lint/format: ESLint via `@and3rn3t/eslint-config`, Prettier (shared base)
- Tests: **Vitest** + Testing Library; coverage via `pnpm test`

<!-- Python repo? Replace this section: pyproject.toml, stdlib-first, ruff, pytest in tests/.
     If it doubles as a Claude skill, keep SKILL.md frontmatter accurate. -->

## Commands

```bash
pnpm install
pnpm dev            # Vite dev server
pnpm cf:dev         # build + wrangler dev (Workers runtime)
pnpm lint           # eslint
pnpm type-check     # tsc --noEmit
pnpm test           # vitest run --coverage
pnpm format         # prettier --write
pnpm build          # type-check + production build
pnpm validate       # lint + type-check + test — the gate (also runs on pre-push)
```

## Deployment

- Cloudflare Workers via `pnpm cf:deploy` (build + `wrangler deploy`) — only when asked; config lives in `wrangler.jsonc`
- Never deploy or commit unless explicitly asked
- Secrets via `wrangler secret put` (local: `.dev.vars`) — never hardcoded, never logged, never read by AI tools

## Code Style

- Write clean, readable code with meaningful names
- Follow language-idiomatic conventions
- Prefer composition over inheritance
- Keep functions focused and under 30 lines
- Use early returns to reduce nesting
- Handle errors explicitly — no silent catches

## Architecture

- Clear separation of concerns; business logic out of route handlers and UI components
- Dependency injection for testability
- Prefer explicit over implicit; no magic strings/numbers

## Testing

- All new code includes unit tests
- Follow Arrange-Act-Assert pattern
- Test behavior, not implementation
- Cover happy path, edge cases, and error cases

## Security

- Validate all user input at boundaries
- Parameterized queries for database operations
- Never log sensitive data
- Use environment variables for secrets

## Conventions

- Conventional commits: `type(scope): description` (enforced with commitlint where configured)
- Branch naming: `type/short-description`
- One logical change per pull request
- Update documentation when changing public APIs

## Definition of Done

- `pnpm validate` passes and `pnpm build` succeeds
- New behavior has tests; changed public APIs have updated docs
- No new lint warnings, `any`, or disabled rules without a comment explaining why
- `CHANGELOG.md` `[Unreleased]` updated for user-visible changes
