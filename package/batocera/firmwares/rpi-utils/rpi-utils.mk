################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Oct 09, 2024
RPI_UTILS_VERSION = 371ae96ff6d8b869d4125137fdc73b86fe154245
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS = -DSTATIC=STATIC

$(eval $(cmake-package))
