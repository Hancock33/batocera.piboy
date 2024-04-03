################################################################################
#
# libserum
#
################################################################################
# Version: Commits on Jan 22, 2024
LIBSERUM_VERSION = 400787b03936487c6960e1b87a41637e31c74c2d
LIBSERUM_SITE = $(call github,zesinger,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md
LIBSERUM_DEPENDENCIES =
LIBSERUM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSERUM_INSTALL_STAGING = YES

LIBSERUM_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))