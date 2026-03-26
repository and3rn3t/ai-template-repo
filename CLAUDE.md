# CLAUDE.md — Claude Code Project Instructions

<!--
  This file is read by Claude Code (Anthropic's CLI coding agent).
  It serves the same purpose as .github/copilot-instructions.md but for Claude Code.
  Keep both files in sync if using multiple AI tools.
-->

## Project Overview

<!-- Describe your project here -->
This is a template repository demonstrating AI-assisted development configuration.

## Code Style

- Write clean, readable code with meaningful names
- Follow language-idiomatic conventions
- Prefer composition over inheritance; favor small, focused functions
- Use early returns to reduce nesting
- Handle errors explicitly — no silent catches

## Architecture

- Separation of concerns: controllers → services → repositories
- Dependency injection for testability
- Keep business logic out of route handlers and UI components

## Testing

- All new code must include unit tests
- Follow Arrange-Act-Assert pattern
- Test behavior and outcomes, not implementation details
- Cover happy path, edge cases, and error paths

## Build Commands

```bash
# Install dependencies
npm install

# Run tests
npm test

# Run linter
npm run lint

# Build for production
npm run build
```

## Conventions

- Conventional commits: `type(scope): description`
- Branch naming: `type/short-description`
- Keep PRs focused on a single logical change
- Validate all user input; use parameterized queries
- Never hardcode secrets; use environment variables
