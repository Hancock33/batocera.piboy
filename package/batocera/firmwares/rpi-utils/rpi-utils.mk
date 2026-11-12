################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on Nov 12, 2026
RPI_UTILS_VERSION = 4284bd7418aa696d72a8df243211cf256dad70cb
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-Wl,-O1,--as-needed -fuse-ld=mold -ltinfo"
RPI_UTILS_CONF_OPTS += -DSTATIC=STATIC
RPI_UTILS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

$(eval $(cmake-package))
