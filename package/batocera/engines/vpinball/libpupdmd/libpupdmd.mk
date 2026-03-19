################################################################################
#
# libpupdmd
#
################################################################################
# Version: Commits on Mar 18, 2026
LIBPUPDMD_VERSION = cd186754ba0dcc1ea418d5557d59d7bf2ed628a3
LIBPUPDMD_SITE = $(call github,PPUC,libpupdmd,$(LIBPUPDMD_VERSION))
LIBPUPDMD_LICENSE = GPLv3
LIBPUPDMD_LICENSE_FILES = LICENSE
LIBPUPDMD_DEPENDENCIES =
LIBPUPDMD_SUPPORTS_IN_SOURCE_BUILD = NO
LIBPUPDMD_INSTALL_STAGING = YES

LIBPUPDMD_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
