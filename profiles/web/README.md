# Web profile — React + TypeScript + Vite on Cloudflare Workers

A complete, working starter. `make new-repo NAME=x` copies it (plus the root
baseline files) into a new repo; to adopt it by hand, copy everything here into
the repo root and replace `replace-project-name` (lowercase — wrangler requires it).

Verified: `pnpm install && pnpm validate && pnpm build && pnpm format:check`
and `wrangler deploy --dry-run` all pass on a fresh copy.

| File                                  | Purpose                                                                                                                                             |
| ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `package.json`                        | pnpm 11, Node ≥24; scripts `dev`, `cf:dev`, `build`, `lint`, `type-check`, `format(:check)`, `test`, `validate`, `cf:deploy`                        |
| `pnpm-workspace.yaml`                 | `allowBuilds` (esbuild, workerd), `minimumReleaseAge`, home for `overrides`                                                                         |
| `eslint.config.js`                    | extends [`@and3rn3t/eslint-config`](https://github.com/and3rn3t/eslint-config)                                                                      |
| `prettier.config.js`, `tsconfig.json` | mirror the eslint-config package's prettier/tsconfig bases — switch to importing/extending them once `@and3rn3t/eslint-config@>=0.4.0` is published |
| `vite.config.ts`                      | React plugin, `@/` alias, Vitest (jsdom, v8 coverage)                                                                                               |
| `wrangler.jsonc`                      | Workers static assets with SPA fallback; comments show how to add an API worker and bindings                                                        |
| `index.html`, `src/`                  | minimal app + one Testing Library test                                                                                                              |

Tailwind: add `tailwindcss` + `prettier-plugin-tailwindcss` and switch the Prettier
base to `prettier-tailwind`.
