################################################################################
#
# libwinevbs
#
################################################################################
# Version: Commits on May 19, 2026
LIBWINEVBS_VERSION = fed727400e19f32b1f659b96763b604c3d55d502
LIBWINEVBS_SITE = $(call github,vpinball,libwinevbs,$(LIBWINEVBS_VERSION))
LIBWINEVBS_LICENSE = LGPL-2.1
LIBWINEVBS_LICENSE_FILES = LICENSE
LIBWINEVBS_DEPENDENCIES =
LIBWINEVBS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBWINEVBS_INSTALL_STAGING = YES

LIBWINEVBS_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
