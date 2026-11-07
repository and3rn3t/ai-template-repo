# Python profile

Baseline files for pyproject-based Python CLIs / skills. `make new-repo TYPE=python`
and `make sync-apply` copy these into Python repos; edit them here, not in `tools/`.

| File | Lands at | Notes |
|---|---|---|
| `ci.yml` | `.github/workflows/ci.yml` | calls `reusable-python-test.yml` (pytest) |
| `codeql.yml` | `.github/workflows/codeql.yml` | `languages: python` |
| `.pre-commit-config.yaml` | `.pre-commit-config.yaml` | conventional-commit hook (`pre-commit install --hook-type commit-msg`) |
| `renovate.json` | `renovate.json` | standalone config; `make renovate-tier` adjusts per activity tier |

Everything else (`.editorconfig`, `SECURITY.md`, community files, shared workflows)
comes from the repo root, same as every other repo type.
