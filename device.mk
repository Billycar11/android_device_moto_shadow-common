#
# Copyright (C) 2011 The Android Open Source Project
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
#

#
# This is the product configuration for a generic Motorola Droid X (shadow)
#

# The gps/telephony config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)	
# Blobs and bootmenu stuff
$(call inherit-product, device/moto/shadow-common/shadow-blobs.mk)
$(call inherit-product, device/moto/shadow-common/bootstrap/bootstrap.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
# Get some sounds
$(call inherit-product-if-exists, frameworks/base/data/sounds/AllAudio.mk)
# Get everything else from the parent package
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)

ifeq ($(TARGET_PRODUCT),$(filter $(TARGET_PRODUCT),cm_shadow))
$(call inherit-product, vendor/motorola/shadow-common/shadow-vendor.mk)
endif

## (3)  Finally, the least specific parts, i.e. the non-CDMA-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.media.capture.flip=horizontalandvertical \
	ro.com.google.locationfeatures=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	net.dns1=8.8.8.8 \
	net.dns2=8.8.4.4 \
	ro.opengles.version = 131072 \
	persist.sys.usb.config=mass_storage,adb \
	hwui.use.blacklist=true \
	ro.sf.lcd_density=240 \
	ro.bq.gpu_to_cpu_unsupported=1 \
	dalvik.vm.debug.alloc=0 \
	ro.hwui.disable_scissor_opt=true \
	ro.setupwizard.enable_bypass=1 \
	persist.sys.root_access=3 \
	ro.config.low_ram=true  \
	dalvik.vm.jit.codecachesize=0 \
	ro.input.noresample=1 \
	debug.sf.fb_always_on=1 \
	debug.egl.hw=1 \
	debug.sf.hw=1 \
	debug.sf.no_hw_vsync=1
#	cm.updater.uri=http://defy.cm-for.us/api \

# wifi props
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	softap.interface=wlan0 \
	wifi.supplicant_scan_interval=60 \

# telephony props
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=500 \
	ro.telephony.default_network=4 \
	mobiledata.interfaces=ppp0 \
	persist.ril.mux.retries=500 \
	persist.ril.mux.sleep=2 \
	persist.ril.mux.noofchannels=7 \
	persist.ril.modem.ttydevice=/dev/usb/tty1-3:1.0 \
	persist.ril.features=0x07 \
	persist.ril.mux.ttydevice=/dev/ttyS0 \
	persist.ril.pppd.start.fail.max=16 \
	ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
	ro.cdma.home.operator.alpha=Verizon \
	ro.cdma.home.operator.numeric=310004 \
	ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
	keyguard.no_require_sim=true

DEVICE_PACKAGE_OVERLAYS += device/moto/shadow-common/overlay

# Permissions files
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# ICS sound
PRODUCT_PACKAGES += \
	hcitool hciattach hcidump \
	libaudioutils audio.a2dp.default  \
	libaudiohw_legacy \

# OMX stuff
PRODUCT_PACKAGES += dspexec libbridge libLCML libOMX_Core libstagefrighthw
PRODUCT_PACKAGES += libOMX.TI.AAC.encode libOMX.TI.AAC.decode libOMX.TI.AMR.decode libOMX.TI.AMR.encode
PRODUCT_PACKAGES += libOMX.TI.WBAMR.encode libOMX.TI.MP3.decode libOMX.TI.WBAMR.decode
PRODUCT_PACKAGES += libOMX.TI.Video.Decoder libOMX.TI.Video.encoder
PRODUCT_PACKAGES += libOMX.TI.JPEG.Encoder

# Droid X stuff
PRODUCT_PACKAGES += libfnc DXParts MotoFM MotoFMService VoiceDialer

# Core stuff
PRODUCT_PACKAGES += charge_only_mode mot_boot_mode

# CM9 apps
PRODUCT_PACKAGES += Torch HwaSettings make_ext4fs

# Experimental TI OpenLink
PRODUCT_PACKAGES += libnl_2 iw libbt-vendor uim-sysfs libbluedroid

# Wifi
PRODUCT_PACKAGES += \
    lib_driver_cmd_wl12xx \
    dhcpcd.conf \
    hostapd.conf \
    wpa_supplicant.conf \
    regulatory.bin \
    ti_wfd_libs \
    calibrator \

# Should be after the full_base include, which loads languages_full
PRODUCT_LOCALES := en_US en_GB en_IN fr_FR it_IT de_DE es_ES hu_HU uk_UA zh_CN zh_TW ru_RU nl_NL se_SV cs_CZ pl_PL pt_BR da_DK ko_KR el_GR ro_RO iw_IL ar_EG

# Include drawables for all densities
PRODUCT_AAPT_CONFIG := hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_NAME := full_shadow
PRODUCT_DEVICE := shadow

