# Packages
PRODUCT_PACKAGES += \
#    CustomDoze \
    WallpaperPicker2
#    WeatherClient

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni
    
$(call inherit-product, vendor/nexus/prebuilt/prebuilt.mk)
