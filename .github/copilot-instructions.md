# Project Guidelines

<!-- 
  This file provides workspace-wide instructions that are automatically included
  in every Copilot chat interaction. Keep it concise and actionable.
  
  IMPORTANT: Use EITHER this file OR AGENTS.md at the project root — not both.
  See the root AGENTS.md for the alternative open-standard format.
-->

## Code Style

- Write clean, readable code with meaningful variable and function names
- Follow the language's idiomatic conventions and community standards
- Prefer composition over inheritance; favor small, focused functions
- Use consistent naming: `camelCase` for variables/functions, `PascalCase` for classes/types
- Keep functions under 30 lines; extract helpers for complex logic

## Architecture

- Follow a clear separation of concerns (e.g., controllers, services, repositories)
- Use dependency injection where appropriate for testability
- Keep business logic out of route handlers and UI components
- Prefer explicit over implicit; avoid magic strings and numbers

## Build and Test

- All new code must include unit tests
- Run `npm test` (or project-appropriate command) before committing
- Use descriptive test names that explain the expected behavior
- Follow the Arrange-Act-Assert pattern in tests

## Conventions

- Use early returns to reduce nesting
- Prefer `const` over `let`; never use `var`
- Handle errors explicitly — no silent catches
- Log meaningful context with errors (what failed, with what input)
- Use environment variables for configuration; never hardcode secrets

## Documentation

- Add JSDoc/docstrings for public APIs and complex functions
- Keep comments focused on "why", not "what"
- Update README when adding new features or changing setup steps

## Security

- Validate and sanitize all user input at system boundaries
- Use parameterized queries for database operations
- Never log sensitive data (tokens, passwords, PII)
- Follow the principle of least privilege for permissions and access
