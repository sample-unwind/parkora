# Frontend Development Plan - Parkora SvelteKit

## Overview

This document outlines the implementation plan for the Parkora frontend using SvelteKit, Tailwind CSS, and DaisyUI with Keycloak OIDC authentication.

**Target:** Faza 5 - Grafični vmesnik (10 points)

## Git Branching Strategy

```
main ← dev ← feature/sveltekit-scaffold
           ← feature/tailwind-daisyui
           ← feature/keycloak-auth
           ← feature/core-pages
           ← feature/deployment
```

- `main`: Production branch (stable)
- `dev`: Development branch for integration
- `feature/<name>`: Feature branches from dev
- PRs use squash merge

---

## Phase 1: Repository Setup

| # | Task | Status | Branch |
|---|------|--------|--------|
| 1 | Create GitHub repo `sample-unwind/frontend` (public, Node.js .gitignore, README) | pending | - |
| 2 | Clone repo: `git clone git@github.com:sample-unwind/frontend.git` | pending | - |
| 3 | Create dev branch: `git checkout -b dev && git push -u origin dev` | pending | `dev` |

---

## Phase 2: SvelteKit Scaffold

| # | Task | Status | Branch |
|---|------|--------|--------|
| 4 | Create feature branch: `git checkout -b feature/sveltekit-scaffold` | pending | `feature/sveltekit-scaffold` |
| 5 | Scaffold SvelteKit: `npx sv create ./` | pending | `feature/sveltekit-scaffold` |
| 6 | Install dependencies: `npm install` | pending | `feature/sveltekit-scaffold` |
| 7 | Commit scaffold (ask user first) | pending | `feature/sveltekit-scaffold` |
| 8 | Push & create PR to dev | pending | `feature/sveltekit-scaffold` → `dev` |
| 9 | Merge PR (squash) | pending | `dev` |

---

## Phase 3: Tailwind CSS & DaisyUI Styling

| # | Task | Status | Branch |
|---|------|--------|--------|
| 10 | Create feature branch: `git checkout dev && git pull && git checkout -b feature/tailwind-daisyui` | pending | `feature/tailwind-daisyui` |
| 11 | Install deps: `npm install tailwindcss@latest @tailwindcss/vite@latest daisyui@latest` | pending | `feature/tailwind-daisyui` |
| 12 | Configure Vite: add `tailwindcss()` plugin before `sveltekit()` in `vite.config.ts` | pending | `feature/tailwind-daisyui` |
| 13 | Import Tailwind in CSS: `@import "tailwindcss"; @plugin "daisyui";` in `src/app.css` | pending | `feature/tailwind-daisyui` |
| 14 | Commit styling setup (ask user first) | pending | `feature/tailwind-daisyui` |
| 15 | Push & create PR to dev | pending | `feature/tailwind-daisyui` → `dev` |
| 16 | Merge PR (squash) | pending | `dev` |

---

## Phase 4: Keycloak OIDC Authentication

| # | Task | Status | Branch |
|---|------|--------|--------|
| 17 | Create feature branch: `git checkout dev && git pull && git checkout -b feature/keycloak-auth` | pending | `feature/keycloak-auth` |
| 18 | Install openid-client: `npm install openid-client` | pending | `feature/keycloak-auth` |
| 19 | Configure OIDC in `hooks.server.ts` for realm `parkora`, client `frontend-app` | pending | `feature/keycloak-auth` |
| 20 | Create login page: `src/routes/login/+page.svelte` | pending | `feature/keycloak-auth` |
| 21 | Create callback route: `src/routes/callback/+server.ts` | pending | `feature/keycloak-auth` |
| 22 | Configure fetch with JWT Authorization header | pending | `feature/keycloak-auth` |
| 23 | Commit auth setup (ask user first) | pending | `feature/keycloak-auth` |
| 24 | Push & create PR to dev | pending | `feature/keycloak-auth` → `dev` |
| 25 | Merge PR (squash) | pending | `dev` |

**Keycloak Details:**
- URL: `https://keycloak.parkora.crn.si/auth/`
- Realm: `parkora`
- Client: `frontend-app` (public)
- Test users: `testuser1` / `password123`, `testuser2` / `password123`

---

## Phase 5: Core Pages & Components

| # | Task | Status | Branch |
|---|------|--------|--------|
| 26 | Create feature branch: `git checkout dev && git pull && git checkout -b feature/core-pages` | pending | `feature/core-pages` |
| 27 | Create home page: `src/routes/+page.svelte` (show parking list if authenticated) | pending | `feature/core-pages` |
| 28 | Create mock API: `src/routes/api/v1/parking/+server.ts` (GET returns JSON parking spots) | pending | `feature/core-pages` |
| 29 | Create ParkingList component: `src/lib/components/ParkingList.svelte` with DaisyUI cards | pending | `feature/core-pages` |
| 30 | Add responsive styling with Tailwind utility classes | pending | `feature/core-pages` |
| 31 | Commit core pages (ask user first) | pending | `feature/core-pages` |
| 32 | Push & create PR to dev | pending | `feature/core-pages` → `dev` |
| 33 | Merge PR (squash) | pending | `dev` |

---

## Phase 6: Deployment Configuration

| # | Task | Status | Branch |
|---|------|--------|--------|
| 34 | Create feature branch: `git checkout dev && git pull && git checkout -b feature/deployment` | pending | `feature/deployment` |
| 35 | Create Dockerfile (Node 18 alpine, build & serve) | pending | `feature/deployment` |
| 36 | Set up GitHub Actions: `.github/workflows/docker.yml` (build → push to GHCR on main) | pending | `feature/deployment` |
| 37 | Create Helm chart: `/helm` directory with deployment, service, ingress for `parkora.crn.si` | pending | `feature/deployment` |
| 38 | Commit deployment configs (ask user first) | pending | `feature/deployment` |
| 39 | Push & create PR to dev | pending | `feature/deployment` → `dev` |
| 40 | Merge PR (squash) | pending | `dev` |

---

## Phase 7: Testing & Final Release

| # | Task | Status | Branch |
|---|------|--------|--------|
| 41 | Test locally: `npm run build && npm run preview`, verify OIDC flow | pending | `dev` |
| 42 | Create PR from dev to main: `gh pr create --base main --head dev --reviewer stjepans` | pending | `dev` → `main` |

---

## Technical Stack

| Technology | Version | Purpose |
|------------|---------|---------|
| SvelteKit | Latest | Frontend framework |
| Tailwind CSS | v4 | Utility-first CSS |
| DaisyUI | v5 | Component library |
| openid-client | Latest | OIDC authentication |
| Node.js | 18 | Runtime |

## Configuration Files

### vite.config.ts
```typescript
import tailwindcss from "@tailwindcss/vite";
import { sveltekit } from "@sveltejs/kit/vite";
import { defineConfig } from "vite";

export default defineConfig({
  plugins: [tailwindcss(), sveltekit()],
});
```

### src/app.css
```css
@import "tailwindcss";
@plugin "daisyui";
```

---

## Current Todo List Status

All 42 tasks are **pending**. Ready to begin execution upon user confirmation.
