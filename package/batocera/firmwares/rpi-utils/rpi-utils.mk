################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Aug 11, 2025
RPI_UTILS_VERSION = e923ccad57d2a22f606c8fe0d1096e782a090fc9
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS = -DSTATIC=STATIC
RPI_UTILS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

$(eval $(cmake-package))
