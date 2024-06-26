################################################################################
#
# libpupdmd
#
################################################################################
# Version: Commits on Jun 26, 2024
LIBPUPDMD_VERSION = ee45981afaf39df3e7bcddf559011bf4567ce3ea
LIBPUPDMD_SITE = $(call github,PPUC,libpupdmd,$(LIBPUPDMD_VERSION))
LIBPUPDMD_LICENSE = GPLv3
LIBPUPDMD_LICENSE_FILES = LICENSE
LIBPUPDMD_DEPENDENCIES =
LIBPUPDMD_SUPPORTS_IN_SOURCE_BUILD = NO
LIBPUPDMD_INSTALL_STAGING = YES

LIBPUPDMD_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
