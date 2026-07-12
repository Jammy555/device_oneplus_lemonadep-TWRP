#!/system/bin/sh
# automatically set device props for unified tree shared-hardware models/variants


load_op9pro()
{
    local rf_ver=$(getprop ro.boot.rf_version)
    local model="OnePlus 9 Pro 5G"
    case "$rf_ver" in
        11) model="LE2120" ;;
        12) model="LE2127" ;;
        13) model="LE2121" ;;
        21) model="LE2123" ;;
        22) model="LE2125" ;;
    esac

    resetprop "ro.build.product" "OnePlus9Pro"
    resetprop "ro.display.series" "OnePlus 9 Pro 5G"
    resetprop "ro.product.device" "OnePlus9Pro"
    resetprop "ro.product.model" "$model"
    resetprop "ro.product.name" "OnePlus9Pro"
    resetprop "ro.product.odm.device" "OnePlus9Pro"
    resetprop "ro.product.odm.model" "$model"
    resetprop "ro.product.odm.name" "OnePlus9Pro"
    resetprop "ro.product.product.device" "OnePlus9Pro"
    resetprop "ro.product.product.model" "$model"
    resetprop "ro.product.product.name" "OnePlus9Pro"
    resetprop "ro.product.system.device" "OnePlus9Pro"
    resetprop "ro.product.system.model" "$model"
    resetprop "ro.product.system.name" "OnePlus9Pro"
    resetprop "ro.product.system_ext.device" "OnePlus9Pro"
    resetprop "ro.product.system_ext.model" "$model"
    resetprop "ro.product.system_ext.name" "OnePlus9Pro"
    resetprop "ro.product.vendor.device" "OnePlus9Pro"
    resetprop "ro.product.vendor.model" "$model"
    resetprop "ro.product.vendor.name" "OnePlus9Pro"
    resetprop "ro.build.fingerprint" "OnePlus/OnePlus9Pro/OnePlus9Pro:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.vendor.build.fingerprint" "OnePlus/OnePlus9Pro/OnePlus9Pro:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.bootimage.build.fingerprint" "OnePlus/OnePlus9Pro/OnePlus9Pro:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.system.build.fingerprint" "OnePlus/OnePlus9Pro/OnePlus9Pro:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.system_ext.build.fingerprint" "OnePlus/OnePlus9Pro/OnePlus9Pro:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.odm.build.fingerprint" "OnePlus/OnePlus9Pro/OnePlus9Pro:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.product.build.fingerprint" "OnePlus/OnePlus9Pro/OnePlus9Pro:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    # USB/MTP device name shown on PC
    resetprop "vendor.usb.product_string" "OnePlus 9 Pro 5G"
}

load_op9()
{
    local rf_ver=$(getprop ro.boot.rf_version)
    local model="OnePlus 9 5G"
    case "$rf_ver" in
        11) model="LE2110" ;;
        12) model="LE2117" ;;
        13) model="LE2111" ;;
        21) model="LE2113" ;;
        22) model="LE2115" ;;
    esac

    resetprop "ro.build.product" "OnePlus9"
    resetprop "ro.display.series" "OnePlus 9 5G"
    resetprop "ro.product.device" "OnePlus9"
    resetprop "ro.product.model" "$model"
    resetprop "ro.product.name" "OnePlus9"
    resetprop "ro.product.odm.device" "OnePlus9"
    resetprop "ro.product.odm.model" "$model"
    resetprop "ro.product.odm.name" "OnePlus9"
    resetprop "ro.product.product.device" "OnePlus9"
    resetprop "ro.product.product.model" "$model"
    resetprop "ro.product.product.name" "OnePlus9"
    resetprop "ro.product.system.device" "OnePlus9"
    resetprop "ro.product.system.model" "$model"
    resetprop "ro.product.system.name" "OnePlus9"
    resetprop "ro.product.system_ext.device" "OnePlus9"
    resetprop "ro.product.system_ext.model" "$model"
    resetprop "ro.product.system_ext.name" "OnePlus9"
    resetprop "ro.product.vendor.device" "OnePlus9"
    resetprop "ro.product.vendor.model" "$model"
    resetprop "ro.product.vendor.name" "OnePlus9"
    resetprop "ro.build.fingerprint" "OnePlus/OnePlus9/OnePlus9:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.vendor.build.fingerprint" "OnePlus/OnePlus9/OnePlus9:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.bootimage.build.fingerprint" "OnePlus/OnePlus9/OnePlus9:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.system.build.fingerprint" "OnePlus/OnePlus9/OnePlus9:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.system_ext.build.fingerprint" "OnePlus/OnePlus9/OnePlus9:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.odm.build.fingerprint" "OnePlus/OnePlus9/OnePlus9:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    resetprop "ro.product.build.fingerprint" "OnePlus/OnePlus9/OnePlus9:14/UKQ1.230924.001/R.209d31b_1-39324b:user/release-keys"
    # USB/MTP device name shown on PC
    resetprop "vendor.usb.product_string" "OnePlus 9 5G"
}

# Differentiate between OP9 and OP9 Pro
if grep -q "Pro" /proc/device-tree/model 2>/dev/null; then
    echo "Device is OnePlus 9 Pro" >> /tmp/recovery.log
    load_op9pro
else
    echo "Device is OnePlus 9" >> /tmp/recovery.log
    load_op9
fi

exit 0


