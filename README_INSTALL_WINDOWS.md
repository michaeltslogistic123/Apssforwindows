# README — INSTALL PILAR ERP ON WINDOWS
## PT. PILAR METALINDO BERKAT | Version 1.0

---

## DOWNLOAD

```
https://github.com/michaeltslogistic123/Apssforwindows/releases/
File: Pilar-ERP-1.0.0-Windows-x64.zip
```

---

## QUICK INSTALL (5 MENIT)

### 1. Ekstrak ZIP
Klik kanan → Extract All → Pilih `C:\PilarERP\`

### 2. Jalankan
Double-click: `Pilar ERP.exe`

### 3. Login
- Username: `owner`
- Password: `admin123`

> **Ganti password** segera setelah login pertama!

---

## KONFIGURASI SERVER (Opsional)

Buat file `desktop-config.json` di:
```
C:\Users\[USERNAME]\AppData\Roaming\Pilar ERP\
```

Isi:
```json
{
  "mode": "server",
  "serverUrl": "http://192.168.1.100:5000"
}
```

Ganti IP dengan alamat server Pilar ERP Anda.

---

## FITUR

| Fitur | Shortcut |
|---|---|
| Cari Produk | F2 |
| Pembayaran | F4 |
| Print | F8 / Ctrl+P |
| Refresh | F5 |
| Fullscreen | F11 |

---

## SYSTEM REQUIREMENTS

- Windows 10 x64 (Build 1903+) atau Windows 11 x64
- RAM 4 GB minimum (8 GB recommended)
- Storage 500 MB

---

## TROUBLESHOOTING

| Masalah | Solusi |
|---|---|
| SmartScreen warning | Klik "More info" → "Run anyway" |
| App tidak buka | Install [Visual C++ 2022](https://aka.ms/vs/17/release/vc_redist.x64.exe) |
| Login gagal | Cek serverUrl di config, atau gunakan mode local |
| Layar putih | Tunggu 10 detik (server SQLite sedang start) |

---

## SUPPORT

PT. PILAR METALINDO BERKAT
Developer: OZTECH | oztech.id

---

*Pilar ERP Desktop v1.0 | 2026 | OZTECH*
