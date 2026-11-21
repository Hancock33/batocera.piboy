################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Nov 21, 2026
RPI_UTILS_VERSION = 05e8808e84ed99b168b14a4025dddb9118fa1c17
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-Wl,-O1,--as-needed -fuse-ld=mold -ltinfo"
RPI_UTILS_CONF_OPTS += -DSTATIC=STATIC
RPI_UTILS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

$(eval $(cmake-package))
