################################################################################
#
# libpupdmd
#
################################################################################
# Version: Commits on Mar 29, 2024
LIBPUPDMD_VERSION = 756fc61c1979d9cbe00522db4e5e08cbe2345b45
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
