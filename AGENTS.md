# Project Guidelines (AGENTS.md)

<!--
  AGENTS.md is an open standard alternative to .github/copilot-instructions.md.
  Use ONE or the OTHER — not both. This file is provided as a reference.
  
  If you prefer this format, delete .github/copilot-instructions.md and 
  move this file to the project root.
  
  AGENTS.md supports hierarchy in monorepos:
    /AGENTS.md              - Root defaults
    /frontend/AGENTS.md     - Frontend-specific (overrides root for frontend/)
    /backend/AGENTS.md      - Backend-specific (overrides root for backend/)
-->

## Code Style

- Write clean, readable code with meaningful names
- Follow language-idiomatic conventions
- Prefer composition over inheritance
- Keep functions focused and under 30 lines
- Use early returns to reduce nesting

## Architecture

- Clear separation of concerns (controllers, services, repositories)
- Dependency injection for testability
- Business logic separate from I/O and framework code

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

- Conventional commits: `type(scope): description`
- One logical change per pull request
- Update documentation when changing public APIs
