################################################################################
#
# ares
#
################################################################################
# Version: Commits on Oct 15, 2025
ARES_VERSION = 53a63d6ae24e42b0e463df440d96db01fbba36b0
ARES_SITE = $(call github,ares-emulator,ares,$(ARES_VERSION))
ARES_LICENSE = GPLv3
ARES_DEPENDENCIES = cairo libgl libgtk3 pango sdl2 zlib
# This is needed for sourcery tool, essential for cross compiling
ARES_DEPENDENCIES += host-ares

ARES_SUPPORTS_IN_SOURCE_BUILD = NO

ARES_CONF_OPTS += -DARES_BUILD_LOCAL=OFF
ARES_CONF_OPTS += -DARES_ENABLE_MINIMUM_CPU=OFF
ARES_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
ARES_CONF_OPTS += -DWITH_SYSTEM_ZLIB=ON
ARES_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
ARES_CONF_OPTS += -DARES_ENABLE_LIBRASHADER=OFF

HOST_ARES_CONF_OPTS += $(ARES_CONF_OPTS)
HOST_ARES_CONF_OPTS += -DARES_BUILD_SOURCERY_ONLY=ON

$(eval $(cmake-package))
$(eval $(host-cmake-package))
