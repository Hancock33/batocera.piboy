################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Oct 04, 2024
RPI_UTILS_VERSION = 77205b6fed4abdb4742e4440076b166234a4a0c5
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS = -DSTATIC=STATIC

$(eval $(cmake-package))
