################################################################################
#
# libwinevbs
#
################################################################################
# Version: Commits on Jun 16, 2026
LIBWINEVBS_VERSION = 1f536d35319205be97e9d7a5e1d3a3d7a275c6d6
LIBWINEVBS_SITE = $(call github,vpinball,libwinevbs,$(LIBWINEVBS_VERSION))
LIBWINEVBS_LICENSE = LGPL-2.1
LIBWINEVBS_LICENSE_FILES = LICENSE
LIBWINEVBS_DEPENDENCIES =
LIBWINEVBS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBWINEVBS_INSTALL_STAGING = YES

LIBWINEVBS_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
