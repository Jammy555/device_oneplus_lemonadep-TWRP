#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 3168
TARGET_SCREEN_WIDTH := 1440


# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/oneplus/sm8350-common/common.mk)

PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe \
    android.system.keystore2 \
    fsck.f2fs.vendor_ramdisk \
    defrag.f2fs.vendor_ramdisk \
    fastbootd \
    android.hardware.fastboot@1.1-impl-mock

# Crypto flags are in BoardConfigCommon.mk
# PLATFORM_VERSION and security patch level matching the system ROM
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# TWRP specific build flags
TW_THEME := portrait_hdpi
TW_FORCE_KEYMASTER_VER := true
OF_DEFAULT_KEYMASTER_VERSION := 4.1
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := en
TW_INCLUDE_NTFS_3G := true
TW_ENABLE_BLKDISCARD := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_FB2PNG := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_Y_OFFSET := 110
TW_H_OFFSET := -110
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_NO_SCREEN_BLANK := true
TW_HAS_EDL_MODE := true
TW_EXCLUDE_APEX := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone92/temp"
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
TW_INCLUDE_FASTBOOTD := true
TW_EXCLUDE_TWRPAPP := true
TW_BACKUP_EXCLUSIONS := /data/fonts/,/data/nandswap
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_HAS_MTP := true

TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 1500
TW_MAX_BRIGHTNESS := 4095

TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FQNAME := "IVibrator/default"

TW_SKIP_ADDITIONAL_FSTAB := true
TW_FRAMERATE := 60

TW_LOAD_VENDOR_MODULES := "aw8697.ko adsp_loader_dlkm.ko haptic.ko"

# OrangeFox Recovery Build Vars
OF_MAINTAINER := SuperJammy
FOX_MAINTAINER := SuperJammy
FOX_VARIANT := A14
FOX_TARGET_DEVICES := lemonade,lemonadep,OnePlus9,OnePlus9Pro

# LED & FRP
OF_USE_GREEN_LED := 0
OF_ENABLE_FRP_ADDON := 1

# Backup Settings
OF_QUICK_BACKUP_LIST := /boot;/data;/metadata;/vendor_boot;/dtbo;
OF_SKIP_MULTIUSER_FOLDERS_BACKUP := 1

# System & Partition Tools
OF_USE_DMCTL := 1
OF_NO_ADDITIONAL_MIUI_PROPS_CHECK := 1
FOX_USE_FSCK_EROFS_BINARY := 1
FOX_USE_PATCHELF_BINARY := 1
FOX_USE_XZ_UTILS := 1
FOX_USE_ZSTD_BINARY := 1
FOX_USE_LZ4_BINARY := 1
FOX_COMPRESS_EXECUTABLES := 1
FOX_INSTALLER_DISABLE_AUTOREBOOT := 1
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
OF_ENABLE_LPTOOLS := 1
OF_ENABLE_ALL_PARTITION_TOOLS := 1
OF_FBE_METADATA_MOUNT_IGNORE := 1

# Delete AromaFM
FOX_DELETE_AROMAFM := 1

# Data Format
OF_UNBIND_SDCARD_F2FS := 1
OF_WIPE_METADATA_AFTER_DATAFORMAT := 1
OF_SKIP_DECRYPTED_ADOPTED_STORAGE := 1
OF_FORCE_CASEFOLDING := 1
OF_VAB_ORS_WIPE_DATA_IS_FORMAT := 1

# Extras
# OF_NO_REFLASH_CURRENT_ORANGEFOX is intentionally NOT set so that
# "Flash this current OrangeFox" appears in the Advanced menu
OF_UNMOUNT_SDCARDS_BEFORE_REBOOT := 1
OF_OPTIONS_LIST_NUM := 11
OF_USE_LOCKSCREEN_BUTTON := 1
OF_USE_LZ4_COMPRESSION := 1
FOX_USE_LZ4_BINARY := 1

# Logging
OF_LOOP_DEVICE_ERRORS_TO_LOG := 1
OF_DONT_KEEP_LOG_HISTORY := 1

# Security / Encryption
OF_DEFAULT_KEYMASTER_VERSION := 4.1
OF_ADVANCED_SECURITY := 1

# Screen Settings
OF_CLOCK_POS := 0
OF_ALLOW_DISABLE_NAVBAR := 1

# Flashlight LED paths — must be Makefile vars, NOT just shell exports in vendorsetup.sh
# orangefox.mk bakes these into LOCAL_CFLAGS at compile time
OF_FL_PATH1 := /sys/class/leds/led:torch_0
OF_FL_PATH2 := /sys/class/leds/led:switch_0

# Default timezone: India Standard Time (UTC+5:30, no DST)
# POSIX TZ format: NAME-OFFSET (negative sign = east of UTC)
OF_DEFAULT_TIMEZONE := IST-5:30

# Additional Customizations
FOX_VIRTUAL_AB_DEVICE := 1
FOX_AB_DEVICE := 1
FOX_MOVE_MAGISK_INSTALLER_TO_RAMDISK := 1
FOX_SETTINGS_ROOT_DIRECTORY := /data/recovery
FOX_MISCELLANEOUS_ROOT_DIRECTORY := /sdcard
FOX_USE_BASH_SHELL := 1
FOX_ASH_IS_BASH := 1
FOX_USE_NANO_EDITOR := 1
FOX_DELETE_AROMAFM := 0
FOX_DELETE_INITD_ADDON := 1
FOX_REPLACE_TOOLBOX_GETPROP := 1
FOX_ALLOW_EARLY_SETTINGS_LOAD := 1
FOX_USE_GREP_BINARY := 1
FOX_USE_DATE_BINARY := 1
FOX_USE_PATCHELF_BINARY := 1
FOX_USE_TAR_BINARY := 1
FOX_USE_SED_BINARY := 1
FOX_USE_XZ_UTILS := 1
FOX_USE_ZSTD_BINARY := 1
FOX_USE_BUSYBOX_BINARY := 1
FOX_USE_FSCK_EROFS_BINARY := 1


#Properties
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental"

TARGET_RECOVERY_DEVICE_MODULES += libion \
    device_manifest.xml \
    system_manifest.xml \
    vendor.display.config@2.0.vendor \
    libdisplayconfig.qti \
    vendor.qti.hardware.vibrator.service.oplus \
    libdrm.vendor

RECOVERY_BINARY_SOURCE_FILES += \
    $(TARGET_OUT_VENDOR_EXECUTABLES)/hw/vendor.qti.hardware.vibrator.service.oplus

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/vendor.qti.hardware.vibrator.impl.oplus.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libdrm.so

PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/excluded-input-devices.xml \
    vendor/qcom/opensource/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/excluded-input-devices.xml

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/oneplus/sm8350-common/prebuilt/modules,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1)

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/lemonadep/system/etc/vintf/manifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/manifest.xml \
    $(OUT_DIR)/target/product/lemonadep/vendor/etc/vintf/manifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest.xml

