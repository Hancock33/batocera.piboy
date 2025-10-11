################################################################################
#
# libserum
#
################################################################################
# Version: Commits on Aug 27, 2025
LIBSERUM_VERSION = v2.2.0-concentrate.6
LIBSERUM_SITE = $(call github,PPUC,libserum_concentrate,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md
LIBSERUM_DEPENDENCIES =
LIBSERUM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSERUM_INSTALL_STAGING = YES

LIBSERUM_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
