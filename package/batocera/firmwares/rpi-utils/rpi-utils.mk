################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Jul 19, 2024
RPI_UTILS_VERSION = a1d522f0f1b50858a44fac80523a2bd80098e789
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS = -DSTATIC=STATIC

$(eval $(cmake-package))