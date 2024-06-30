################################################################################
#
# libpupdmd
#
################################################################################
# Version: Commits on Jun 28, 2024
LIBPUPDMD_VERSION = 124f45e5ddd59ceb339591de88fcca72f8c54612
LIBPUPDMD_SITE = $(call github,PPUC,libpupdmd,$(LIBPUPDMD_VERSION))
LIBPUPDMD_LICENSE = GPLv3
LIBPUPDMD_LICENSE_FILES = LICENSE
LIBPUPDMD_DEPENDENCIES =
LIBPUPDMD_SUPPORTS_IN_SOURCE_BUILD = NO
LIBPUPDMD_INSTALL_STAGING = YES

LIBPUPDMD_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
