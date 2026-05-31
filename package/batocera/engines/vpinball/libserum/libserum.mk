################################################################################
#
# libserum
#
################################################################################
# Version: Commits on May 30, 2026
LIBSERUM_VERSION = 8127ec8da9d17e512a081dd2f69dfcb31af9f92a
LIBSERUM_SITE = $(call github,PPUC,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md
LIBSERUM_DEPENDENCIES =
LIBSERUM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSERUM_INSTALL_STAGING = YES

LIBSERUM_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
