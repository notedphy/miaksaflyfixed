#!/system/bin/sh
# MikasaFlymeFix Installer Script
# Author: anothernop

SKIPUNZIP=0

ui_print " "
ui_print "╔═══════════════════════════════════════╗"
ui_print "║      MikasaFlymeFix v1.1              ║"
ui_print "║   FlymeOS GSI Fix for Itel S23+      ║"
ui_print "║        Device: S681LN (UMS9230)       ║"
ui_print "║         Author: anothernop            ║"
ui_print "╚═══════════════════════════════════════╝"
ui_print " "
ui_print "- Installing module..."
ui_print " "

# Set permissions
ui_print "- Setting permissions..."
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755
set_perm $MODPATH/system/build.prop 0 0 0644
set_perm $MODPATH/system.prop 0 0 0644

# Create NFC config directory
mkdir -p $MODPATH/system/etc
set_perm_recursive $MODPATH/system/etc 0 0 0755 0644

ui_print " "
ui_print "✓ Fixes Applied:"
ui_print "  • OTG Detection"
ui_print "  • NFC Enable & Config"
ui_print "  • USB Headset Audio"
ui_print "  • Brightness Control"
ui_print "  • Camera Force Close"
ui_print "  • Display Hang/Freeze"
ui_print "  • Performance Boost"
ui_print "  • Resolution 720p (1600x720)"
ui_print "  • Device Name: itels23plus"
ui_print " "
ui_print "- Installation complete!"
ui_print "- Please REBOOT your device"
ui_print " "
ui_print "═══════════════════════════════════════"
ui_print "  Support: @anothernop on Telegram"
ui_print "═══════════════════════════════════════"
ui_print " "