### **Penjelasan Struktur Modul dan Kode**

Berikut adalah penjelasan rinci mengenai struktur folder dan file yang telah Anda buat, serta bagaimana cara modul ini bekerja secara keseluruhan.

---

### **1. Struktur Modul**

Struktur modul **Hutao-Change-Product** Anda terdiri dari beberapa folder dan file yang berfungsi untuk mengubah informasi perangkat di sistem Android. Berikut adalah struktur lengkapnya:

```
/hutao-change-product
│
├── bin/                    # Folder berisi script yang dapat dijalankan
│   └── hutao-change-product # Script utama untuk mengubah informasi perangkat
├── device-info/            # Folder berisi informasi tentang perangkat
│   └── device-info         # Script untuk menampilkan info perangkat
├── system/                 # Folder berisi file sistem yang perlu dimodifikasi
│   └── build.prop          # File yang berisi informasi perangkat yang dapat dimodifikasi
├── META-INF/               # Folder berisi script yang digunakan oleh Magisk atau KernelSU untuk instalasi
│   └── com/
│       └── google/
│           └── android/
│               └── update-binary # Script yang digunakan saat instalasi
├── uninstall.sh            # Script untuk menghapus atau mengembalikan perubahan
├── install.sh              # Script untuk menginstal modul
└── README.md               # Dokumentasi penggunaan modul
```

### **2. File `hutao-change-product`** (bin/hutao-change-product)

**Fungsi:**
- Script ini adalah inti dari modul yang memungkinkan pengguna untuk mengubah informasi perangkat seperti **model**, **manufacturer**, **brand**, dan **marketname** yang ada di file `build.prop`.

**Proses Kerja:**
1. Menggunakan akses root untuk memodifikasi `build.prop`.
2. Mengizinkan pengguna untuk memilih informasi yang ingin diubah.
3. Menyimpan perubahan dan memberitahu pengguna untuk melakukan reboot perangkat agar perubahan diterapkan.

**Contoh Penggunaan:**
- Setelah Anda menginstal modul ini, Anda dapat menjalankannya di **Termux** atau menggunakan **Magisk** dengan perintah:
  ```bash
  su
  hutao-change-product
  ```
  Kemudian pilih bagian mana yang ingin diubah (misalnya **manufacturer**, **model**, dll.), masukkan nilai baru, dan perubahan akan disimpan ke dalam `build.prop`.

### **3. File `device-info`** (device-info/device-info)

**Fungsi:**
- Script ini digunakan untuk menampilkan informasi perangkat saat ini seperti **model**, **manufacturer**, **brand**, **marketname**, dan spesifikasi lainnya.

**Proses Kerja:**
- Script ini hanya membaca informasi dari **system properties** (`getprop`) dan menampilkannya di layar, sehingga Anda bisa melihat data perangkat sebelum atau setelah perubahan.

**Contoh Penggunaan:**
- Untuk melihat informasi perangkat, Anda bisa menjalankan perintah berikut di **Termux** atau **Magisk**:
  ```bash
  su
  device-info
  ```
  Ini akan menampilkan informasi seperti:
  ```
  📢 Informasi Perangkat:
  📌 Model: Samsung Galaxy S25
  🏭 Manufacturer: Samsung
  🔖 Brand: Samsung
  📱 Marketname: S25 Ultra

  📊 Spesifikasi Perangkat:
  💾 RAM: 8 GB
  🗄️ Internal Storage: 128 GB
  ⚙️ Chipset: Exynos 2100
  🔋 Baterai: 85%
  📟 Sistem Operasi: Android 12
  ⏳ Waktu Bangun: 5 hours, 22 minutes
  ```

### **4. File `build.prop`** (system/build.prop)

**Fungsi:**
- File ini adalah tempat penyimpanan informasi perangkat di Android, seperti **model**, **manufacturer**, dan lainnya.
- Modul ini mengubah nilai di dalam **build.prop** untuk memodifikasi informasi perangkat.

**Proses Kerja:**
- Modul akan menggantikan nilai yang ada di `build.prop` sesuai dengan input dari pengguna. Misalnya, jika Anda memilih untuk mengubah **model perangkat**, maka nilai yang ada di `ro.product.model` akan diganti sesuai dengan nilai baru yang dimasukkan.

### **5. File `update-binary`** (META-INF/com/google/android/update-binary)

**Fungsi:**
- Ini adalah script yang digunakan oleh **Magisk** atau **KernelSU** untuk menjalankan proses instalasi.
- Script ini mengatur apakah file yang dibutuhkan akan diekstrak atau disalin ke direktori yang sesuai.

**Contoh Penggunaan:**
- Magisk atau KernelSU akan menjalankan `update-binary` untuk memastikan semua file yang diperlukan (seperti `hutao-change-product`, `device-info`, dan `build.prop`) dipasang di direktori yang tepat. Ketika modul diinstal, update-binary akan mengatur proses instalasi ini.

### **6. File `install.sh`**

**Fungsi:**
- File ini berfungsi untuk mempersiapkan instalasi modul. Di dalamnya terdapat perintah untuk memastikan **hutao-change-product** bisa dieksekusi dengan benar di **Magisk** atau **KernelSU**.
- Juga mengatur izin akses agar script dapat dijalankan dengan root.

**Contoh Penggunaan:**
- Saat modul diinstal melalui **Magisk** atau **KernelSU**, `install.sh` memastikan bahwa file seperti `hutao-change-product` akan dapat dijalankan dengan perintah:
  ```bash
  chmod +x /data/adb/modules/hutao-change-product/bin/hutao-change-product
  ```

### **7. File `uninstall.sh`**

**Fungsi:**
- File ini berfungsi untuk menghapus semua file yang diinstal oleh modul dan mengembalikan perubahan yang telah dilakukan di sistem.

**Proses Kerja:**
- Ketika modul di-uninstall, `uninstall.sh` akan menghapus **hutao-change-product**, dan jika perlu, dapat mengembalikan perubahan yang telah dilakukan di `build.prop`.

### **8. File `README.md`**

**Fungsi:**
- File ini berisi dokumentasi untuk pengguna modul.
- Menjelaskan cara penggunaan modul, instalasi, dan apa yang harus dilakukan jika terjadi masalah.

**Contoh Isi `README.md`:**
```markdown
# HuTao v1 - Modul untuk Mengubah Model Perangkat

## Deskripsi
Modul ini memungkinkan Anda untuk mengubah informasi perangkat Anda (seperti model, manufacturer, dan lainnya) secara langsung melalui Termux atau Magisk.

## Fitur
- Ubah `ro.product.manufacturer`
- Ubah `ro.product.brand`
- Ubah `ro.product.marketname`
- Ubah `ro.product.model`

## Cara Penggunaan
1. Setelah instalasi, jalankan perintah berikut di **Termux** atau **Magisk**:
   ```bash
   su
   hutao-change-product
   ```
2. Pilih bagian yang ingin Anda ubah dan masukkan nilai baru.

## Instalasi
1. Install melalui Magisk atau KernelSU.
2. Pastikan root akses sudah diberikan.

## Catatan
- Setelah perubahan, Anda harus me-reboot perangkat Anda agar perubahan diterapkan.
- Jika perangkat mengalami masalah, hapus modul ini melalui Magisk atau recovery.
```

---

### **Kesimpulan**

Dengan struktur dan penjelasan yang lebih mendetail ini, Anda sekarang memiliki pemahaman lengkap tentang bagaimana modul ini bekerja. Setiap bagian berfungsi untuk memodifikasi informasi perangkat Android dengan aman dan memungkinkan instalasi melalui **Magisk** atau **KernelSU**.

