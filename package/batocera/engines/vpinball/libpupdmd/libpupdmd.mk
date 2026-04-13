################################################################################
#
# libpupdmd
#
################################################################################
# Version: Commits on Apr 13, 2026
LIBPUPDMD_VERSION = 1e2becff70450e0dd52dbaef767f89728d7957cd
LIBPUPDMD_SITE = $(call github,PPUC,libpupdmd,$(LIBPUPDMD_VERSION))
LIBPUPDMD_LICENSE = GPLv3
LIBPUPDMD_LICENSE_FILES = LICENSE
LIBPUPDMD_DEPENDENCIES =
LIBPUPDMD_SUPPORTS_IN_SOURCE_BUILD = NO
LIBPUPDMD_INSTALL_STAGING = YES

LIBPUPDMD_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
