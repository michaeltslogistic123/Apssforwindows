# RELEASE NOTES — PILAR ERP DESKTOP v1.0
## PT. PILAR METALINDO BERKAT | Windows 10/11 x64

**Release Date:** 2026-06-05
**Build:** 1.0.0
**Platform:** Windows 10/11 x64 (64-bit)
**Electron:** 36.9.5
**Codename:** Metalindo

---

## WHAT'S NEW IN v1.0

### 🖥️ Windows Desktop Application
- First native Windows Desktop build using Electron 36
- Full Pilar ERP system bundled as standalone `.exe`
- Works on Windows 10 (Build 1903+) and Windows 11
- Portable ZIP — no installation required, just extract and run

### 💾 Dual Mode Architecture
- **Server Mode** — connect to existing Pilar ERP server (PostgreSQL backend)
- **Local Mode** — embedded SQLite database for standalone operation
- Configurable via `desktop-config.json` in user AppData

### ⌨️ Keyboard Shortcuts
- `F2` — Product search
- `F4` — Payment/checkout
- `F8` / `Ctrl+P` — Print
- `F5` — Refresh data
- `Escape` — Close modal
- `F11` — Fullscreen toggle

### 🖨️ Printer Support (Configured, Pending Device Test)
- Epson TM-U220D (USB/Serial)
- Thermal receipt 58mm/80mm
- Thermal label 100×150mm
- Windows default printer
- LAN/IP ESC/POS printer
- Configurable via `printerMode` in config

### 📷 Scanner Support (Configured, Pending Device Test)
- USB barcode scanner (keyboard-wedge)
- USB QR code scanner
- Bluetooth scanner
- Serial/COM port scanner
- Configurable via `scannerMode` in config

### 🌙 Dark Mode
- Full dark mode support
- Toggle via View menu or desktop-config.json

### 🌐 Bilingual
- Indonesian (ID) and English (EN)
- 322+ translation keys
- Toggle via Settings

---

## INCLUDED MODULES

| Module | Status |
|---|---|
| Login & Auth (Owner/Admin/Kasir) | ✅ |
| Owner Dashboard (daily/weekly/monthly/yearly) | ✅ |
| POS Kasir (touch-friendly) | ✅ |
| Sales Management | ✅ |
| Purchase Orders | ✅ |
| Inventory & Low Stock Alert | ✅ |
| Warehouse Transfer (multi-gudang) | ✅ |
| QR Label Printing (50×30mm) | ✅ |
| Supplier & Customer Management | ✅ |
| Financial Reports | ✅ |
| Excel Import/Export | ✅ |
| Audit Log | ✅ |
| Dark Mode | ✅ |
| Bilingual ID/EN | ✅ |
| Hardware Diagnostics | ✅ |

---

## SECURITY CHANGES

- `contextIsolation: true` — renderer process isolated from main
- `nodeIntegration: false` — Node.js not exposed to web content
- `webSecurity: true` — same-origin policy enforced
- External URLs open in system browser, not inside app
- API server bound to localhost only
- No hardcoded secrets in bundle

---

## DOWNLOAD

```
https://github.com/michaeltslogistic123/Apssforwindows/releases/tag/v1.0.0
Filename: Pilar-ERP-1.0.0-Windows-x64.zip
```

---

## DEFAULT LOGIN

After first launch (Local Mode):

| Field | Value |
|---|---|
| Username | `owner` |
| Password | `admin123` |

> ⚠️ Change password immediately after first login!

---

## KNOWN LIMITATIONS v1.0

| Item | Status |
|---|---|
| Code signing (EV certificate) | ❌ NOT SIGNED — SmartScreen warning expected |
| NSIS .exe installer | ❌ Requires Windows build machine (wine not available on CI) |
| Auto-update | ❌ Not configured in v1.0 |
| ARM64 Windows | ⚠️ Not tested (x64 binary only) |
| macOS/Linux | ⚠️ Separate build required |

---

## BREAKING CHANGES

None — this is the first Windows Desktop release.
Web app and Android app are unaffected.

---

## UPGRADE PATH

From web version: No migration needed.
- Server Mode users: point to same server URL
- Local Mode users: data starts fresh in new SQLite database

---

## NEXT RELEASE (v1.1 PLANNED)

- [ ] NSIS installer (.exe) with auto-update
- [ ] Code signing (EV certificate)
- [ ] ESC/POS direct thermal print tested on real device
- [ ] ARM64 Windows support
- [ ] Offline sync queue improvements

---

*Release Notes v1.0 | 2026-06-05 | PT. PILAR METALINDO BERKAT | OZTECH*
