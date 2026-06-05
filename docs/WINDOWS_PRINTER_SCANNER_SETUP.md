# WINDOWS PRINTER & SCANNER SETUP GUIDE
## Pilar ERP Desktop | PT. PILAR METALINDO BERKAT

---

## PRINTER SUPPORT

### Printer yang Didukung

| Printer | Interface | Status |
|---|---|---|
| **Epson TM-U220D** | USB / Serial | ✅ Didukung (Windows driver) |
| **Epson TM-T82X** | USB / LAN | ✅ Didukung |
| **Epson TM-T88** | USB / LAN | ✅ Didukung |
| **Thermal 58mm** | USB | ✅ Didukung |
| **Thermal 80mm** | USB / LAN | ✅ Didukung |
| **Label 100×150mm** | USB / LAN | ✅ Didukung |
| **Windows PDF Printer** | Software | ✅ Default |
| **Semua printer Windows** | Via Windows driver | ✅ Didukung |

---

## SETUP PRINTER — WINDOWS MODE (RECOMMENDED)

Cara termudah: gunakan Windows Print Dialog.

### Langkah 1: Install Driver Printer

1. Hubungkan printer ke laptop via USB
2. Windows otomatis mendeteksi dan install driver
3. Atau download driver dari website Epson: https://epson.com/drivers

### Langkah 2: Set Default Printer

```
Settings → Bluetooth & devices → Printers & scanners
→ Pilih printer Anda → Set as default
```

### Langkah 3: Config Pilar ERP

Di `desktop-config.json`:
```json
{
  "printerMode": "windows",
  "printerName": "EPSON TM-U220D"
}
```

Atau biarkan kosong untuk menggunakan printer default Windows:
```json
{
  "printerMode": "windows",
  "printerName": ""
}
```

### Langkah 4: Test Print

Di Pilar ERP → Settings → Hardware → Test Print Page

---

## SETUP PRINTER — ESC/POS USB MODE

Untuk printer thermal yang mendukung ESC/POS langsung (tanpa driver Windows).

### Langkah 1: Install Zadig (USB driver)

1. Download Zadig: https://zadig.akeo.ie/
2. Hubungkan printer USB
3. Buka Zadig → Pilih printer dari list
4. Ganti driver ke "WinUSB"

### Langkah 2: Config

```json
{
  "printerMode": "escpos-usb",
  "labelWidth": "80mm"
}
```

---

## SETUP PRINTER — LAN/IP MODE

Untuk printer thermal yang terhubung via jaringan.

### Langkah 1: Cari IP Printer

Cetak test page dari printer → IP address tertera di kertas
atau
```
arp -a                    ← di Command Prompt
```

### Langkah 2: Config

```json
{
  "printerMode": "escpos-lan",
  "printerIp": "192.168.1.200",
  "printerPort": 9100,
  "labelWidth": "80mm"
}
```

### Langkah 3: Test Koneksi

```cmd
telnet 192.168.1.200 9100
```

---

## UKURAN LABEL / KERTAS

| Jenis | Ukuran | Kegunaan |
|---|---|---|
| Receipt 58mm | 58×∞mm | Struk penjualan kecil |
| Receipt 80mm | 80×∞mm | Struk penjualan standar |
| Label QR | 50×30mm | Label produk QR code |
| Label besar | 100×150mm | Label pengiriman |

Config di `desktop-config.json`:
```json
{
  "labelWidth": "80mm"
}
```

---

## BARCODE / QR SCANNER SETUP

### Jenis Scanner yang Didukung

| Jenis | Interface | Config |
|---|---|---|
| USB HID (paling umum) | USB | `keyboard-wedge` |
| Bluetooth HID | Bluetooth | `keyboard-wedge` |
| Serial/COM | RS-232 | `serial` |
| 2D QR Scanner | USB | `keyboard-wedge` |

---

## SETUP SCANNER — KEYBOARD WEDGE (RECOMMENDED)

Paling umum — scanner mengirim data seperti keyboard ketikan.

### Langkah 1: Hubungkan Scanner

USB scanner: colok langsung ke port USB laptop.
Tidak perlu install driver khusus.

### Langkah 2: Test Scanner

1. Buka Notepad
2. Scan barcode
3. Kode muncul di Notepad = scanner berfungsi ✅

### Langkah 3: Config Pilar ERP

```json
{
  "scannerMode": "keyboard-wedge",
  "scannerSuffix": "\n"
}
```

Suffix `"\n"` = Enter (paling umum). Beberapa scanner menggunakan Tab (`"\t"`).

### Langkah 4: Test di Pilar ERP

1. Buka halaman Products
2. Klik kolom Search
3. Scan barcode produk
4. Produk otomatis muncul ✅

---

## SETUP SCANNER — BLUETOOTH

1. Nyalakan scanner Bluetooth
2. Windows → Settings → Bluetooth → Add device
3. Pasangkan scanner
4. Config sama dengan keyboard-wedge

---

## KONFIGURASI LENGKAP HARDWARE

Contoh `desktop-config.json` lengkap:
```json
{
  "mode": "server",
  "serverUrl": "http://192.168.1.100:5000",
  "printerMode": "windows",
  "printerName": "EPSON TM-U220D",
  "labelWidth": "80mm",
  "scannerMode": "keyboard-wedge",
  "scannerSuffix": "\n"
}
```

---

## HARDWARE DIAGNOSTICS

Di Pilar ERP Desktop:
```
Menu Help → Diagnose Hardware
```

Atau via Menu → View → Hardware Diagnostics

Menampilkan:
- ✅/❌ Printer terdeteksi
- ✅/❌ Scanner berfungsi
- ✅/❌ Koneksi server
- ✅/❌ Database tersedia

---

## PENDING WINDOWS DEVICE TEST

> ⚠️ PENDING WINDOWS DEVICE TEST
> 
> Pengujian hardware fisik berikut memerlukan perangkat Windows:
> - Epson TM-U220D USB direct print test
> - ESC/POS LAN printer test
> - USB barcode scanner keyboard-wedge test
> - Bluetooth scanner pairing test
> - Label 50×30mm QR code print test
> 
> Semua konfigurasi sudah siap. Test pada perangkat Windows nyata.

---

*Printer & Scanner Guide v1.0 | Pilar ERP | OZTECH*
