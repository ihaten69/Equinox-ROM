echo "- Fixing up /product/etc/build.prop"
sed -i "/# Removed by /d" "$WORK_DIR/product/etc/build.prop" \
    && sed -i "s/#bluetooth./bluetooth./g" "$WORK_DIR/product/etc/build.prop" \
    && sed -i "s/?=/=/g" "$WORK_DIR/product/etc/build.prop" \
    && sed -i "$(sed -n "/provisioning.hostname/=" "$WORK_DIR/product/etc/build.prop" | sed "2p;d")d" "$WORK_DIR/product/etc/build.prop"


echo "- Enabling adaptive FPS"
SET_PROP "vendor" "ro.surface_flinger.use_content_detection_for_refresh_rate" "true"
echo "- Fixing DPI"
SET_PROP "vendor" "ro.sf.init.lcd_density" "480"
# echo "- Fixing Bluetooth.."
# ADD_TO_WORK_DIR "r9qxxx" "system" "system/lib64/libbluetooth_jni.so"
sed -i \
    "/use_content_detection/a ro.surface_flinger.set_idle_timer_ms=3000\nro.surface_flinger.set_touch_timer_ms=500\nro.surface_flinger.set_display_power_timer_ms=1000" \
    "$WORK_DIR/vendor/default.prop"

