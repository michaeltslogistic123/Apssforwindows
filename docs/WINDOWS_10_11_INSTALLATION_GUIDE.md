# WINDOWS 10/11 INSTALLATION GUIDE
## Pilar ERP Desktop App | PT. PILAR METALINDO BERKAT

---

## SYSTEM REQUIREMENTS

| Component | Minimum | Recommended |
|---|---|---|
| OS | Windows 10 x64 (Build 1903+) | Windows 11 x64 |
| RAM | 4 GB | 8 GB |
| Storage | 500 MB | 2 GB |
| Processor | Intel Core i3 / AMD Ryzen 3 | Intel Core i5 / AMD Ryzen 5 |
| Display | 1366×768 | 1920×1080 |
| Network | Optional (Server mode: required) | 100 Mbps LAN |

---

## PRE-INSTALLATION CHECKLIST

- [ ] Windows 10 x64 Build 1903+ atau Windows 11 x64
- [ ] Hak admin (untuk pertama kali install)
- [ ] Minimal 500 MB storage kosong
- [ ] Koneksi jaringan ke server ERP (jika Server Mode)
- [ ] Printer terinstall di Windows (untuk cetak struk/label)

---

## INSTALLATION — METHOD A: ZIP PORTABLE (RECOMMENDED)

### Step 1: Download

```
https://github.com/michaeltslogistic123/Apssforwindows/releases/
Filename: Pilar-ERP-1.0.0-Windows-x64.zip
```

### Step 2: Ekstrak

```
Klik kanan ZIP → Extract All → Pilih C:\PilarERP\
```

Hasil ekstrak:
```
C:\PilarERP\
├── Pilar ERP.exe          ← file utama
├── resources\
│   ├── app.asar           ← kode aplikasi
│   ├── server.cjs         ← API server lokal
│   └── frontend\          ← web UI
├── locales\               ← bahasa sistem
└── *.dll                  ← Windows runtime
```

### Step 3: Buat Desktop Shortcut

```
Klik kanan "Pilar ERP.exe" → Send to → Desktop (Create Shortcut)
```

### Step 4: Konfigurasi (Server Mode)

Buka Notepad, buat file `desktop-config.json`, simpan di:
```
C:\Users\[USERNAME]\AppData\Roaming\Pilar ERP\desktop-config.json
```

Isi:
```json
{
  "mode": "server",
  "serverUrl": "http://192.168.1.100:5000",
  "language": "id",
  "darkMode": false
}
```

### Step 5: Jalankan

Double-click `Pilar ERP.exe`

---

## INSTALLATION — METHOD B: INSTALLER EXE (NSIS)

Jika tersedia `Pilar-ERP-Setup-1.0.0-x64.exe`:

1. Double-click installer
2. Klik "Next" → pilih folder install → "Install"
3. Selesai! Shortcut otomatis dibuat di Desktop dan Start Menu

---

## WINDOWS DEFENDER SMARTSCREEN

Pertama kali jalankan, mungkin muncul peringatan:

> "Windows protected your PC — Microsoft Defender SmartScreen prevented an unrecognized app from starting."

**Solusi:**
1. Klik "More info"
2. Klik "Run anyway"
3. App akan berjalan normal

> Peringatan ini muncul karena app belum di-codesign dengan sertifikat berbayar. App AMAN untuk digunakan.

---

## WINDOWS FIREWALL SETUP

Pertama kali buka app, Windows Firewall mungkin minta izin:

1. Pilih "Private networks" ✅
2. Klik "Allow access"

**Manual firewall rule** (jika perlu):
```
Control Panel → Windows Defender Firewall → 
Advanced Settings → Inbound Rules → New Rule →
Program → Browse ke Pilar ERP.exe → Allow → OK
```

---

## STARTUP / AUTO-START (OPSIONAL)

Agar Pilar ERP otomatis buka saat Windows login:

1. Tekan `Win + R` → ketik `shell:startup` → Enter
2. Copy shortcut "Pilar ERP" ke folder yang terbuka

---

## UNINSTALL

### ZIP Portable:
1. Hapus folder `C:\PilarERP\`
2. Hapus shortcut di Desktop
3. Hapus data: `C:\Users\[USER]\AppData\Roaming\Pilar ERP\`

### Installer EXE:
```
Settings → Apps → Pilar ERP → Uninstall
```

---

## BACKUP DATA (LOCAL MODE)

Database SQLite lokal tersimpan di:
```
C:\Users\[USERNAME]\AppData\Roaming\Pilar ERP\pilar-erp.db
```

Backup otomatis ke Google Drive (opsional):
1. Install Google Drive for Desktop
2. Set `backupPath` di config ke folder Google Drive lokal

---

## TROUBLESHOOTING INSTALLATION

| Masalah | Solusi |
|---|---|
| "VCRUNTIME140.dll not found" | Install [Visual C++ Redistributable 2022](https://aka.ms/vs/17/release/vc_redist.x64.exe) |
| App crash saat buka | Jalankan sebagai Admin. Check Event Viewer |
| Layar putih/blank | Tunggu 10 detik, server lokal sedang start |
| "Port 3999 in use" | Restart PC, atau kill process di port 3999 |
| App terbuka tapi login gagal | Periksa `serverUrl` di config |

---

*Installation Guide v1.0 | Pilar ERP | PT. PILAR METALINDO BERKAT | OZTECH*
