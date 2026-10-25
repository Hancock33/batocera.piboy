################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Oct 24, 2026
RPI_UTILS_VERSION = 496be8f704651f74662a2ab07c4cc89ac5bd9b8a
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-Wl,-O1,--as-needed -fuse-ld=mold -ltinfo"
RPI_UTILS_CONF_OPTS += -DSTATIC=STATIC
RPI_UTILS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

$(eval $(cmake-package))
