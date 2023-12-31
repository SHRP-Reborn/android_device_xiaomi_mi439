#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common mithorium-common
include device/xiaomi/mithorium-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/mi439

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
TARGET_PREBUILT_KERNEL := device/xiaomi/kernel-mithorium/mi439/Image.gz-dtb

# Kernel - DTBO
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := device/xiaomi/kernel-mithorium/mi439/dtbo.img

# Partitions
BOARD_USES_METADATA_PARTITION := true

# Partitions - dynamic
BOARD_SUPER_PARTITION_BLOCK_DEVICES := cust system vendor
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE := 536870912
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3221225472
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 1073741824
BOARD_SUPER_PARTITION_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE) )

BOARD_SUPER_PARTITION_GROUPS := mi439_dynpart
BOARD_MI439_DYNPART_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304 )
BOARD_MI439_DYNPART_PARTITION_LIST := system system_ext product vendor odm

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Ramdisk
BOARD_RECOVERYIMAGE_MAX_RAMDISK_SIZE := 20971520
BOARD_RAMDISK_USE_LZMA := true
LZMA_RAMDISK_TARGETS := recovery

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)

# TWRP
TW_MAX_BRIGHTNESS := 2047
TW_CUSTOM_CLOCK_POS := left
TW_CUSTOM_CPU_POS := 350
TW_FRAMERATE := 60

#SHRP-specific lines
SHRP_PATH := device/xiaomi/mi439
SHRP_MAINTAINER := rxuglr
SHRP_DEVICE_CODE := mi439
SHRP_OFFICIAL := true
SHRP_EDL_MODE := 1
SHRP_INTERNAL := /sdcard
SHRP_EXTERNAL := /sdcard1
SHRP_OTG := /usb_otg
SHRP_FLASH := 1
SHRP_FLASH_MAX_BRIGHTNESS := 255
SHRP_REC_TYPE := SAR
SHRP_REC := /dev/block/bootdevice/by-name/recovery
SHRP_DEVICE_TYPE := A_Only
SHRP_EXPRESS := true
SHRP_EXPRESS_USE_DATA := true
SHRP_DARK := true

#SHRP Addons
SHRP_SKIP_DEFAULT_ADDON_1 := true
SHRP_SKIP_DEFAULT_ADDON_2:= true
