################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Mar 25, 2026
RPI_UTILS_VERSION = 313407c9ca8654a6f30ddef25eae9cc283a343c8
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-ltinfo"
RPI_UTILS_CONF_OPTS += -DSTATIC=STATIC
RPI_UTILS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

$(eval $(cmake-package))
