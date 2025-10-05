################################################################################
#
# rgbds
#
################################################################################
# Version: Commits on Sept 30, 2025
RGBDS_VERSION = v1.0.0-rc2
RGBDS_SITE = $(call github,gbdev,rgbds,$(RGBDS_VERSION))
RGBDS_LICENSE = MIT
RGBDS_SUPPORTS_IN_SOURCE_BUILD = NO

HOST_RGBDS_DEPENDENCIES = host-libpng
HOST_RGBDS_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
HOST_RGBDS_CONF_ENV += LDFLAGS=-lpthread

$(eval $(host-cmake-package))
