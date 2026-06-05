# PILAR ERP — WINDOWS DESKTOP APP GUIDE
## PT. PILAR METALINDO BERKAT | Version 1.0 | Windows 10/11 x64

---

## OVERVIEW

Pilar ERP Desktop adalah aplikasi Windows native yang membungkus sistem ERP lengkap dalam satu executable. Menggunakan Electron framework, aplikasi berjalan di Windows 10/11 x64 tanpa memerlukan browser.

### Mode Operasi

| Mode | Keterangan | Cocok Untuk |
|---|---|---|
| **Server Mode** | Terhubung ke server Pilar ERP yang sudah ada (Mac Mini/cloud) | Multi-user, jaringan kantor |
| **Local Mode** | Menjalankan database SQLite lokal di laptop | Standalone, tanpa jaringan |

---

## QUICK START

### Langkah 1 — Download

Download dari GitHub:
```
https://github.com/michaeltslogistic123/Apssforwindows/releases/
```
File: `Pilar-ERP-1.0.0-Windows-x64.zip`

### Langkah 2 — Ekstrak ZIP

1. Klik kanan `Pilar-ERP-1.0.0-Windows-x64.zip`
2. Pilih "Extract All..." atau gunakan 7-Zip
3. Pilih folder tujuan, misalnya `C:\PilarERP\`

### Langkah 3 — Jalankan

Double-click `Pilar ERP.exe`

> **Pertama kali:** Windows Defender SmartScreen mungkin muncul. Klik "More info" → "Run anyway".

---

## KONFIGURASI SERVER URL

### Opsi A — Gunakan Config File

1. Buka folder: `C:\Users\[NamaUser]\AppData\Roaming\Pilar ERP\`
2. Buat file baru: `desktop-config.json`
3. Isi dengan:

```json
{
  "mode": "server",
  "serverUrl": "http://192.168.1.100:5000"
}
```

Ganti `192.168.1.100` dengan IP address Mac Mini server.

### Opsi B — Mode Lokal (Standalone)

Tidak perlu config. Jalankan langsung, app akan menggunakan SQLite lokal.

```json
{
  "mode": "local"
}
```

Data tersimpan di: `C:\Users\[NamaUser]\AppData\Roaming\Pilar ERP\pilar-erp.db`

---

## FITUR LENGKAP

| Fitur | Status |
|---|---|
| Login (Owner/Admin/Kasir) | ✅ |
| Dashboard Owner | ✅ |
| POS Kasir | ✅ |
| Sales / Penjualan | ✅ |
| Purchase / Pembelian | ✅ |
| Inventory Management | ✅ |
| Warehouse Transfer | ✅ |
| QR Label Printing | ✅ |
| Laporan Keuangan | ✅ |
| Dark Mode | ✅ |
| Bilingual ID/EN | ✅ |
| ESC/POS Printer | ✅ |
| USB Barcode Scanner | ✅ |

---

## KEYBOARD SHORTCUTS

| Shortcut | Fungsi |
|---|---|
| **F2** | Cari Produk |
| **F4** | Pembayaran / Checkout |
| **F8** | Print |
| **F5** | Refresh data |
| **Ctrl+P** | Print |
| **Ctrl+F** | Search |
| **Escape** | Tutup modal |
| **F11** | Fullscreen toggle |

---

## UPDATE APP

1. Download versi terbaru dari GitHub releases
2. Ekstrak ke folder baru (jangan overwrite)
3. Copy `desktop-config.json` dari folder lama ke folder baru
4. Jalankan versi baru

Data SQLite lokal **tidak hilang** saat update karena tersimpan di `AppData\Roaming`.

---

## TROUBLESHOOTING

### App tidak mau buka

- Pastikan Windows 10 64-bit (minimum)
- Install Visual C++ Redistributable 2022 dari Microsoft
- Jalankan sebagai Administrator (klik kanan → Run as Administrator)

### Tidak bisa connect ke server

- Periksa IP address server di `desktop-config.json`
- Ping server: `ping 192.168.1.100`
- Periksa firewall Windows: izinkan port 5000
- Pastikan server sedang berjalan

### Printer tidak terdeteksi

- Lihat: `docs/WINDOWS_PRINTER_SCANNER_SETUP.md`

---

*Pilar ERP Desktop v1.0 | PT. PILAR METALINDO BERKAT | OZTECH*
