################################################################################
#
# libpupdmd
#
################################################################################
# Version: Commits on Mar 30, 2024
LIBPUPDMD_VERSION = 332fc4aab2639a1b159545375df15e405cb2c82c
LIBPUPDMD_SITE = $(call github,PPUC,libpupdmd,$(LIBPUPDMD_VERSION))
LIBPUPDMD_LICENSE = GNU3
LIBPUPDMD_LICENSE_FILES = LICENSE
LIBPUPDMD_DEPENDENCIES =
LIBPUPDMD_INSTALL_STAGING = YES

LIBPUPDMD_CONF_OPTS += -DPLATFORM=linux
LIBPUPDMD_CONF_OPTS += -DARCH=x64

define LIBPUPDMD_CMAKE_HACK
sed -i -e s+"pupdmd-decode.h"+"pupdmd.h"+ $(@D)/CMakeLists.txt
endef

LIBPUPDMD_PRE_CONFIGURE_HOOKS += LIBPUPDMD_CMAKE_HACK

$(eval $(cmake-package))
