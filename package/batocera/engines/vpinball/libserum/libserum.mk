################################################################################
#
# libserum
#
################################################################################
# Version: Commits on May 31, 2026
LIBSERUM_VERSION = 84330eafc6f925f89451078f6d0ea9bf3a1b739b
LIBSERUM_SITE = $(call github,PPUC,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md
LIBSERUM_DEPENDENCIES =
LIBSERUM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSERUM_INSTALL_STAGING = YES

LIBSERUM_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
