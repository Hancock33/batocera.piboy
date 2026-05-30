################################################################################
#
# libserum
#
################################################################################
# Version: Commits on May 29, 2026
LIBSERUM_VERSION = bd750627cb068798910465bc534111f83538ec5d
LIBSERUM_SITE = $(call github,PPUC,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md
LIBSERUM_DEPENDENCIES =
LIBSERUM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSERUM_INSTALL_STAGING = YES

LIBSERUM_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
