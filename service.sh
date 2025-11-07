#!/system/bin/sh
# MikasaFlymeFix - FlymeOS GSI Fix Module untuk Itel S23+ UMS9230
# Author: anothernop
# Version: 1.0

MODDIR=${0%/*}

# Tunggu boot selesai
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 1
done

sleep 5

# Fix OTG
setprop persist.sys.usb.config adb,mtp
setprop sys.usb.controller "musb-hdrc"
setprop persist.vendor.usb.config mtp,adb
chmod 666 /sys/class/usb_role/musb-hdrc.0.auto-usb/role 2>/dev/null

# Fix Brightness
chmod 666 /sys/class/backlight/*/brightness 2>/dev/null
chmod 666 /sys/class/leds/lcd-backlight/brightness 2>/dev/null
setprop persist.sys.brightness.low.gamma 1
setprop ro.vendor.cabc.enable false
setprop persist.vendor.max.brightness 255

# Performance tweaks untuk UMS9230
setprop debug.performance.tuning 1
setprop ro.vendor.qti.sys.fw.bg_apps_limit 32
setprop persist.device_config.runtime_native.usap_pool_enabled true
setprop dalvik.vm.dex2oat-cpu-set 0,1,2,3,4,5,6,7
setprop dalvik.vm.dex2oat-threads 8

# Fix Camera Force Close
setprop persist.vendor.camera.privapp.list "org.codeaurora.snapcam,com.android.camera,com.flyme.camera"
setprop vendor.camera.aux.packagelist "org.codeaurora.snapcam,com.android.camera,com.flyme.camera"
setprop persist.camera.stats.test 5
setprop persist.vendor.camera.enableAdvanceFeatures 0x347
setprop persist.vendor.camera.enableNCS 1
setprop persist.vendor.camera.expose.aux 1
setprop vendor.camera.aux.packagelist2 "com.android.camera,com.flyme.camera"

# Fix untuk Unisoc UMS9230
setprop ro.vendor.platform.is.unisoc 1
setprop persist.vendor.radio.snapshot_enabled 0
setprop persist.vendor.radio.snapshot_timer 0

# GPU & Display fix untuk layar hang
setprop debug.sf.hw 1
setprop debug.egl.hw 1
setprop debug.composition.type gpu
setprop debug.sf.disable_backpressure 1
setprop debug.sf.latch_unsignaled 1
setprop ro.surface_flinger.max_frame_buffer_acquired_buffers 3
setprop ro.surface_flinger.use_smart_90_for_video true
setprop debug.sf.enable_hwc_vds 1
setprop debug.sf.recomputecrop 0

# Disable thermal throttling yang aggressive
setprop persist.sys.thermal.enable 0
setprop vendor.sys.thermal.enable 0

# Audio fix
setprop persist.audio.fluence.speaker true
setprop persist.audio.fluence.voicecall true
setprop ro.audio.soundfx.dirac false
setprop persist.audio.dirac.speaker false

# Network & Connectivity
setprop persist.data.df.dev_name rmnet_usb0
setprop persist.rmnet.data.enable true

# Memory Management
setprop ro.config.fha_enable true
setprop ro.sys.fw.bg_apps_limit 32
setprop ro.config.dha_cached_max 16
setprop ro.config.dha_empty_max 24

# Touch responsiveness
chmod 666 /sys/class/touch/touch_dev/gesture_control 2>/dev/null
chmod 666 /sys/class/touch/*/gesture_control 2>/dev/null

# Log
log -t MikasaFlymeFix "Module loaded successfully"
echo "MikasaFlymeFix v1.0 loaded - $(date)" >> /data/local/tmp/mikasaflymefixed.log

exit 0
