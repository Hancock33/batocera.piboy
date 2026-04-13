################################################################################
#
# libserum
#
################################################################################
# Version: Commits on Apr 13, 2026
LIBSERUM_VERSION = 55939dfe645f6a2e01785bec2cf6d723bf62def4
LIBSERUM_SITE = $(call github,PPUC,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md
LIBSERUM_DEPENDENCIES =
LIBSERUM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSERUM_INSTALL_STAGING = YES

LIBSERUM_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
