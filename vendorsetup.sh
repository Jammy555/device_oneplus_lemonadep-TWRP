FDEVICE="lemonadep"

fox_get_target_device() {
  if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/" 2>/dev/null; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif set | grep BASH_ARGV | grep -q "$FDEVICE" 2>/dev/null; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/" 2>/dev/null; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif echo "$0" | grep -q "$FDEVICE" 2>/dev/null; then
      FOX_BUILD_DEVICE="$FDEVICE";
  fi
  return 0
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device || true
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export LC_ALL="C"
    export TARGET_ARCH="arm64"
    export ALLOW_MISSING_DEPENDENCIES=true

    # --- Shell-script variables for OrangeFox_A12.sh ---
    # These MUST be exported as shell environment variables.
    # OrangeFox_A12.sh runs as a shell script at post-build time and reads
    # these from the environment — it cannot see Makefile variables in device.mk.
    #
    # Build metadata (controls output filename):
    export FOX_VARIANT="A14"
    export FOX_BUILD_TYPE="Unofficial"
    export FOX_TARGET_DEVICES="lemonade,lemonadep,OnePlus9,OnePlus9Pro"

    # Magisk embedding into ramdisk (OrangeFox_A12.sh line ~1258):
    # Without this export, /FFiles/OF_Magisk/Magisk.zip is never created,
    # causing "file doesn't exist, please reflash recovery" on fastboot boot.
    export FOX_MOVE_MAGISK_INSTALLER_TO_RAMDISK="1"

    # Shell/bash settings (used by OrangeFox_A12.sh to configure bash in ramdisk):
    export FOX_USE_BASH_SHELL="1"
    export FOX_ASH_IS_BASH="1"
    export FOX_BUILD_BASH="1"

    # Extra features, diagnostics, and size reduction utilities:
    export FOX_USE_FSCK_EROFS_BINARY="1"
    export FOX_USE_PATCHELF_BINARY="1"
    export FOX_USE_XZ_UTILS="1"
    export FOX_USE_ZSTD_BINARY="1"
    export FOX_USE_LZ4_BINARY="1"
    export FOX_INSTALLER_DISABLE_AUTOREBOOT="1"

    # Apply patches automatically
    PATCH_DIR="device/oneplus/lemonadep/patches"
    if [ -d "$PATCH_DIR" ]; then
        if [ -s "$PATCH_DIR/bootable_recovery.patch" ] && [ ! -f "bootable/recovery/.patched" ]; then
            echo "I: Applying OrangeFox bootable/recovery patches..."
            patch -d bootable/recovery -p1 < "$PATCH_DIR/bootable_recovery.patch" && touch bootable/recovery/.patched
        fi
        if [ -s "$PATCH_DIR/vendor_recovery.patch" ] && [ ! -f "vendor/recovery/.patched" ]; then
            echo "I: Applying OrangeFox vendor/recovery patches..."
            patch -d vendor/recovery -p1 < "$PATCH_DIR/vendor_recovery.patch" && touch vendor/recovery/.patched
        fi
        if [ -s "$PATCH_DIR/build_make.patch" ] && [ ! -f "build/make/.patched" ]; then
            echo "I: Applying OrangeFox build/make patches..."
            patch -d build/make -p1 < "$PATCH_DIR/build_make.patch" && touch build/make/.patched
        fi
    fi
else
    if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
        echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
    fi
fi

true
