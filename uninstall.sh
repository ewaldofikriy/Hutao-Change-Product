#!/system/bin/sh

# Fungsi untuk menampilkan pesan
ui_print() {
    echo "$1"
}

# Proses uninstalasi
ui_print "❌ Menghapus Hutao Change Product..."

# Kembalikan perubahan build.prop
cp -f /data/adb/modules/ewaldofikriy-hutao-change-product/system/build.prop /system/build.prop
ui_print "✔️ Perubahan dibatalkan."

# Hapus file yang disalin ke /system/bin/
rm -f /system/bin/hutao-change-product
rm -f /system/bin/device-info.sh
ui_print "✔️ File hutao-change-product dan device-info.sh dihapus."

# Menampilkan pesan selesai
ui_print "🚫 Modul berhasil dihapus, reboot perangkat untuk menerapkan perubahan!"
exit 0
