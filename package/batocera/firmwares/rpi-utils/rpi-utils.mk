################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Sept 03, 2024
RPI_UTILS_VERSION = d4f8fb543a892ba65bfc608511bf582c0425aa81
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS = -DSTATIC=STATIC

$(eval $(cmake-package))
