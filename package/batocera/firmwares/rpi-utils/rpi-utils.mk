################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Nov 19, 2025
RPI_UTILS_VERSION = 6e0779b1c552976e0da2374c0325a8c9c77b6010
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS = -DSTATIC=STATIC
RPI_UTILS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

$(eval $(cmake-package))
