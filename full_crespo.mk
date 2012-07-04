# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for crespo hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Get the long list of APNs
#PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Camera
PRODUCT_PACKAGES := \
    Camera

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
	PhaseBeam \
	HoloSpiralWallpaper \
	MagicSmokeWallpapers \
	NoiseField \
	Galaxy4 \
        librs_jni
# Root
PRODUCT_PACKAGES += \
	Superuser \
	Superuser.apk \
	su

# Some Extras
PRODUCT_PACKAGES += \
	CrespoParts \
	Development\
        FileManager\
	SpareParts\
	LatinIME \
	VideoEditor \
	VoiceDialer \
	Basic \
	Stk

#CM stuff
PRODUCT_PACKAGES += \
	DSPManager \
	libcyanogen-dsp \
	audio_effects.conf

# T-Mobile theme engine
include vendor/carz/themes/themes_common.mk

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, device/samsung/crespo/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_crespo
PRODUCT_DEVICE := crespo
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus S
PRODUCT_MANUFACTURER := Samsung
PRODUCT_RELEASE_NAME := NS

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_FINGERPRINT=google/soju/crespo:4.0.4/IMM76D/299849:user/release-keys PRIVATE_BUILD_DESC="soju-user 4.0.4 IMM76D 299849 release-keys" BUILD_NUMBER=299849

PRODUCT_PROPERTY_OVERRIDES += \
       ro.modversion=CARZ-$(PRODUCT_RELEASE_NAME)-$(PLATFORM_VERSION)-V-$(shell date +%m%d.%H%M)
