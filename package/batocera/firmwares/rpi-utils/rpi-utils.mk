################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Oct 07, 2024
RPI_UTILS_VERSION = 30c8c789291e5aeebae9f3b0f5336a1e492841f4
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS = -DSTATIC=STATIC

$(eval $(cmake-package))
