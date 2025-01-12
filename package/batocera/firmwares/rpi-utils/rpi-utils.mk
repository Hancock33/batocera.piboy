################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Jan 06, 2025
RPI_UTILS_VERSION = 33aa4da93d8da90d5075e8cd48e72cc90048b9f3
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS = -DSTATIC=STATIC
RPI_UTILS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

$(eval $(cmake-package))
