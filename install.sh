#!/sbin/sh

# Fungsi untuk menampilkan pesan
ui_print() {
    echo "$1"
}

# Memulai instalasi
ui_print "🔧 Memulai instalasi Hutao Change Product..."

# Salin file build.prop ke lokasi yang benar
cp -f /data/adb/modules/ewaldofikriy-hutao-change-product/system/build.prop /system/build.prop
ui_print "✔️ Berhasil mengupdate build.prop"

# Salin hutao-change-product dan device-info.sh ke /system/bin/
cp -f /data/adb/modules/ewaldofikriy-hutao-change-product/bin/hutao-change-product /system/bin/
cp -f /data/adb/modules/ewaldofikriy-hutao-change-product/bin/device-info.sh /system/bin/
ui_print "✔️ Berhasil menyalin hutao-change-product dan device-info.sh ke /system/bin/"

# Set izin yang benar untuk file yang dipasang
chmod 755 /system/bin/hutao-change-product
chmod 755 /system/bin/device-info.sh

# Menampilkan pesan selesai
ui_print "🎉 Instalasi selesai, reboot perangkat untuk menerapkan perubahan!"
exit 0
