# Pilar ERP Desktop v1.0.1 — Store Error Fix

## What changed

Critical bug fix: App crashed on startup with:
```
TypeError: Store is not a constructor
```

**Root cause:** `electron-store@10` is ESM-only and incompatible with CommonJS main.cjs

**Fix:** Downgraded to `electron-store@8.2.0` (stable CJS) + hardened import guard

## Download v1.0.1

See [Releases](../../releases/tag/v1.0.1) for the fixed package.

SHA256: `504a093f1aadc9303ab1b03b4c709021829664ea2760e891e96b3c14ea0c0ce8`
