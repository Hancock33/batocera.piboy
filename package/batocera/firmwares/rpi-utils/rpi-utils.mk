################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Nov 14, 2024
RPI_UTILS_VERSION = 2cfbf1d5fab52f35c04aff79378bf821fefb87c3
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS = -DSTATIC=STATIC

$(eval $(cmake-package))
