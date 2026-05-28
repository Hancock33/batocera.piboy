################################################################################
#
# rpi-utils
#
################################################################################
# Version: Commits on May 28, 2026
RPI_UTILS_VERSION = e1e814ccad620b027a3ca770e1481616be053f9b
RPI_UTILS_SITE = $(call github,raspberrypi,utils,$(RPI_UTILS_VERSION))
RPI_UTILS_LICENSE = BSD-3-Clause
RPI_UTILS_LICENSE_FILES = LICENCE
RPI_UTILS_INSTALL_STAGING = YES
RPI_UTILS_DEPENDENCIES = dtc

RPI_UTILS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-ltinfo"
RPI_UTILS_CONF_OPTS += -DSTATIC=STATIC
RPI_UTILS_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

$(eval $(cmake-package))
