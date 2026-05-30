################################################################################
#
# libserum
#
################################################################################
# Version: Commits on May 30, 2026
LIBSERUM_VERSION = ee4147a203a3bec6a9890afc539cfd4c3b6e13ff
LIBSERUM_SITE = $(call github,PPUC,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md
LIBSERUM_DEPENDENCIES =
LIBSERUM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSERUM_INSTALL_STAGING = YES

LIBSERUM_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
