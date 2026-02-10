################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Feb 10, 2026
RPI_UTILS_VERSION = bdbc6f88cbc917b4ddf33b440aff36c36370d467
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS = -DSTATIC=STATIC
RPI_UTILS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

$(eval $(cmake-package))
