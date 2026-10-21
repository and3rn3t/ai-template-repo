# README Standard

Every active `and3rn3t` repo opens its README the same way, so a visitor can tell in five seconds what the project is, whether it works, and how to run it. `make dashboard` scores this as the **Presentation** column (`tools/lib/presentation.mjs`).

## Required shape (in order)

| # | Section | Rule | Checked as |
|---|---|---|---|
| 1 | **H1 + tagline** | `# Name`, then one sentence (bold is fine) saying what it is and who it's for. | `title` |
| 2 | **Badge row** | CI workflow status (the repo's real workflow file), license, live site if there is one. Extra badges go after these three. | `badges` |
| 3 | **Screenshot or GIF** | Live site / app → `docs/screenshot.png` (or the repo's existing assets folder). CLI / skill → an image of real terminal output. No image possible → add `presentation:screenshot` to `.consistency-ignore`. | `screenshot` |
| 4 | **Features** | 4–10 bullets, one line each. | — |
| 5 | **Getting started** | Prerequisites, install, run — copy-pasteable. Heading must contain *Getting started*, *Quick start*, *Install*, *Setup* or *Usage*. | `quickstart` |
| 6 | **Tech stack** | One short list or table. | — |
| 7 | **License** | `## License` + one line linking `LICENSE`. | `license-sec` |

Everything else (architecture, commands, deployment, roadmap, troubleshooting) goes **between Tech stack and License**. Long detail belongs in `docs/`, linked from the README.

## Rules

- **Real links only.** CI badge = `https://github.com/and3rn3t/<repo>/actions/workflows/<file>.yml/badge.svg` for a workflow that exists and runs on `main`. License badge text matches `LICENSE`. Live-site badge/link = the repo's GitHub homepage (`gh repo view and3rn3t/<repo> --json homepageUrl`).
- **No vanity or stale numbers** in badges (hand-typed coverage %, "status: production") unless something keeps them current.
- **Forks credit upstream** directly under the tagline: `> Fork of [owner/repo](…) by <author>. …`
- **Screenshots** are 1280×800 (or similar), light theme unless the app is dark-only, no personal data.

## Skeleton

````markdown
# Project Name

**One sentence: what it is and who it's for.**

[![CI](https://github.com/and3rn3t/REPO/actions/workflows/ci.yml/badge.svg)](https://github.com/and3rn3t/REPO/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Live site](https://img.shields.io/badge/live-example.andernet.dev-brightgreen)](https://example.andernet.dev)

![Project Name screenshot](docs/screenshot.png)

## Features

- **Thing one** — what it does for the user
- **Thing two** — …

## Getting started

Prerequisites: Node 24+, pnpm.

```bash
git clone https://github.com/and3rn3t/REPO.git
cd REPO
pnpm install
pnpm dev
```

## Tech stack

- React + TypeScript + Vite
- Cloudflare Workers (wrangler)

<!-- Architecture, commands, deployment, etc. go here -->

## License

[MIT](LICENSE)
````
