# Versioning System
ABC_BASE_VERSION = v10

ifndef ABC_BUILD_TYPE
    ABC_BUILD_TYPE := OFFICIAL
endif

# Only include DU-Updater for official, weeklies, and rc builds
#ifeq ($(filter-out OFFICIAL WEEKLIES RC,$(ABC_BUILD_TYPE)),)
   # PRODUCT_PACKAGES += \
       # DU-Updater
#endif

# Sign builds if building an official or weekly build
ifeq ($(filter-out OFFICIAL WEEKLIES,$(ABC_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/security/releasekey
endif

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
ABC_VERSION := $(TARGET_PRODUCT)-$(ABC_BASE_VERSION)-$(BUILD_DATE)-$(BUILD_TIME)-$(ABC_BUILD_TYPE)
BUILD_DATE_TIME := $(BUILD_TIME)$(BUILD_DATE)
TARGET_BACON_NAME := $(ABC_VERSION)
ROM_FINGERPRINT := ABC/$(PLATFORM_VERSION)/$(ABC_BUILD_TYPE)/$(BUILD_DATE)$(BUILD_TIME)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.abc.version=$(ABC_VERSION) \
    ro.build.datetime=$(BUILD_DATE_TIME) \
    ro.mod.version=$(ABC_BUILD_TYPE)-$(ABC_BASE_VERSION)-$(BUILD_DATE) \
    ro.abc.fingerprint=$(ROM_FINGERPRINT)
