################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Oct 25, 2024
RPI_UTILS_VERSION = 6a2a6becebbc38fde34a94386457ac8210f9119b
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS = -DSTATIC=STATIC

$(eval $(cmake-package))
