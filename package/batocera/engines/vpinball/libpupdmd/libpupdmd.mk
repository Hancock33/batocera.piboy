################################################################################
#
# libpupdmd
#
################################################################################
# Version: Commits on May 08, 2026
LIBPUPDMD_VERSION = 4a1123220e6dce73c87cc584494df2ac82cb6f4c
LIBPUPDMD_SITE = $(call github,PPUC,libpupdmd,$(LIBPUPDMD_VERSION))
LIBPUPDMD_LICENSE = GPLv3
LIBPUPDMD_LICENSE_FILES = LICENSE
LIBPUPDMD_DEPENDENCIES =
LIBPUPDMD_SUPPORTS_IN_SOURCE_BUILD = NO
LIBPUPDMD_INSTALL_STAGING = YES

LIBPUPDMD_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
