################################################################################
#
# libserum
#
################################################################################
# Version: Commits on Apr 12, 2024
LIBSERUM_VERSION = 348c4280b5a3a9f88125bdf756b7b2d30f39f533
LIBSERUM_SITE = $(call github,zesinger,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md
LIBSERUM_DEPENDENCIES =
LIBSERUM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSERUM_INSTALL_STAGING = YES

LIBSERUM_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))