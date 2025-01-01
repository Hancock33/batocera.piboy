################################################################################
#
# faudio
#
################################################################################
# Version: Commits on Jan 01, 2025
FAUDIO_VERSION = 25.01
FAUDIO_SITE = $(call github,FNA-XNA,FAudio,$(FAUDIO_VERSION))
FAUDIO_LICENSE = ZLIB
FAUDIO_LICENSE_FILES = LICENSE
FAUDIO_SUPPORTS_IN_SOURCE_BUILD = NO
FAUDIO_INSTALL_STAGING = YES
FAUDIO_DEPENDENCIES = host-bison host-flex host-libtool gstreamer1 gst1-plugins-base sdl2

ifeq ($(BR2_PACKAGE_WINE_CUSTOM),y)
FAUDIO_DEPENDENCIES += host-wine-custom
endif

FAUDIO_CONF_OPTS += -DGSTREAMER=ON

$(eval $(cmake-package))
