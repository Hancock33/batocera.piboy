################################################################################
#
# libpupdmd
#
################################################################################
# Version: Commits on Apr 01, 2024
LIBPUPDMD_VERSION = 8dedc8c81ded2f6b8ca4614752d395aae0332c6c
LIBPUPDMD_SITE = $(call github,PPUC,libpupdmd,$(LIBPUPDMD_VERSION))
LIBPUPDMD_LICENSE = GPLv3
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
