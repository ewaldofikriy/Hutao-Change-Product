#!/system/bin/sh

# Fungsi untuk mencetak teks dengan warna
ui_print() {
    echo "$1"
}

# Menampilkan informasi perangkat saat ini
ui_print "📢 Informasi Perangkat Saat Ini:"

DEVICE=$(getprop ro.product.model)
MANUFACTURER=$(getprop ro.product.manufacturer)
BRAND=$(getprop ro.product.brand)
MARKETNAME=$(getprop ro.product.marketname)

ui_print "📌 Model: $DEVICE"
ui_print "🏭 Manufacturer: $MANUFACTURER"
ui_print "🔖 Brand: $BRAND"
ui_print "📱 Marketname: $MARKETNAME"

# Menampilkan spesifikasi perangkat tambahan
ui_print "📊 Spesifikasi Perangkat:"
RAM=$(free -h | grep Mem | awk '{print $2}')
INTERNAL_STORAGE=$(df -h /data | awk 'NR==2 {print $2}')
CHIPSET=$(cat /proc/cpuinfo | grep "Hardware" | uniq | awk '{print $3}')
BATTERY=$(cat /sys/class/power_supply/battery/capacity)
OS=$(getprop ro.build.version.release)
UPTIME=$(uptime -p)

ui_print "💾 RAM: $RAM"
ui_print "🗄️ Internal Storage: $INTERNAL_STORAGE"
ui_print "⚙️ Chipset: $CHIPSET"
ui_print "🔋 Baterai: $BATTERY%"
ui_print "📟 Sistem Operasi: Android $OS"
ui_print "⏳ Waktu Bangun: $UPTIME"
exit 0
