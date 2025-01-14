################################################################################
#
# libzedmd
#
################################################################################
# Version: Commits on Jan 12, 2025
LIBZEDMD_VERSION = a77d27877ed4504cc329592606e1976171562329
LIBZEDMD_SITE = $(call github,PPUC,libzedmd,$(LIBZEDMD_VERSION))
LIBZEDMD_LICENSE = GPLv3
LIBZEDMD_LICENSE_FILES = LICENSE
LIBZEDMD_DEPENDENCIES = libframeutil libserialport
LIBZEDMD_SUPPORTS_IN_SOURCE_BUILD = NO
LIBZEDMD_INSTALL_STAGING = YES

LIBZEDMD_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
