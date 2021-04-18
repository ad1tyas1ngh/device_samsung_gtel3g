#
# Copyright (C) 2021 The Lineage Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/samsung/gtel3g

# Inherit from vendor tree
$(call inherit-product-if-exists, vendor/samsung/gtel3g/gtel3g-vendor.mk)

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# Permissions
PRODUCT_COPY_FILES+= \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.midi.xml

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog

# Audio
PRODUCT_PACKAGES += \
    audio.primary.sc8830 \
    libaudio-resampler \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libtinyalsa

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects_vendor.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects_vendor.conf \
    $(LOCAL_PATH)/configs/audio/audio_hw.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_hw.xml \
    $(LOCAL_PATH)/configs/audio/audio_para:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_para \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/codec_pga.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/codec_pga.xml \
    $(LOCAL_PATH)/configs/audio/tiny_hw.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/tiny_hw.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libbluetooth_jni \
    bluetooth.default

# Camera config
PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1

# Codecs
PRODUCT_PACKAGES += \
    libcolorformat_switcher \
    libstagefrighthw \
    libstagefright_sprd_mpeg4dec \
    libstagefright_sprd_mpeg4enc \
    libstagefright_sprd_h264dec \
    libstagefright_sprd_h264enc \
    libstagefright_sprd_vpxdec \
    libstagefright_sprd_aacdec \
    libstagefright_sprd_mp3dec

# Common libs
PRODUCT_PACKAGES += \
    librilutils \
    libril_shim \
    libgps_shim

# Device props
PRODUCT_PROPERTY_OVERRIDES := \
    ro.com.android.dataroaming=false

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Filesystem management tools
PRODUCT_PACKAGES += \
    f2fstat \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    setup_fs

# GPS
PRODUCT_PACKAGES += \
    libgpspc \
    libefuse

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.xml

# HWC
PRODUCT_PACKAGES += \
    libHWCUtils \
    gralloc.sc8830 \
    libmemoryheapion \
    libion_sprd

# System init.rc files
PRODUCT_PACKAGES += \
    at_distributor.rc \
    chown_service.rc \
    data.rc \
    dns.rc \
    engpc.rc \
    gpsd.rc \
    hostapd.rc \
    kill_phone.rc \
    macloader.rc \
    mediacodec.rc \
    modem_control.rc \
    modemd.rc \
    nvitemd.rc \
    p2p_supplicant.rc \
    phoneserver.rc \
    refnotify.rc \
    set_mac.rc \
    smd_symlink.rc \
    swap.rc \
    wpa_supplicant.rc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/sec_touchscreen.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchscreen.kl \
    $(LOCAL_PATH)/keylayout/samsung-keypad.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/samsung-keypad.kl \
    $(LOCAL_PATH)/keylayout/sci-keypad.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sci-keypad.kl

# Lights
PRODUCT_PACKAGES += \
    lights.sc8830

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/mediaserver.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/mediaserver.rc \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs.xml

# Media config
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_telephony.xml

# Packages
PRODUCT_PACKAGES += \
    SamsungDoze \
    Jelly \
    Snap

# Performance
PRODUCT_PROPERTY_OVERRIDES += \
    sys.use_fifo_ui=1

# PowerHAL
PRODUCT_PACKAGES += \
    power.sc8830

# Rootdir files
PRODUCT_PACKAGES += \
    init.sc8830.rc \
    init.sc8830.usb.rc \
    init.gtel3g_base.rc \
    ueventd.sc8830.rc \
    fstab.sc8830 \
    init.board.rc \
    init.wifi.rc

# RIL
PRODUCT_PACKAGES += \
    rild.rc

# Samsung Service Mode
PRODUCT_PACKAGES += \
    SamsungServiceMode

# sdcardfs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# WiFi
PRODUCT_PACKAGES += \
    macloader \
    wpa_supplicant.conf \
    dhcpcd.conf \
    wpa_supplicant \
    hostapd

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/wpa_supplicant_overlay.conf

# Misc packages
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory
