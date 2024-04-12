################################################################################
#
# libserum
#
################################################################################
# Version: Commits on Apr 12, 2024
LIBSERUM_VERSION = cfc37cf8f0c8482dc991884a48e4a29ba8767c3f
LIBSERUM_SITE = $(call github,zesinger,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md
LIBSERUM_DEPENDENCIES =
LIBSERUM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSERUM_INSTALL_STAGING = YES

LIBSERUM_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))