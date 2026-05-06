################################################################################
#
# libwinevbs
#
################################################################################
# Version: Commits on May 05, 2026
LIBWINEVBS_VERSION = a226c4ed9fd7bf73f4621a6ce969beb220e1996b
LIBWINEVBS_SITE = $(call github,vpinball,libwinevbs,$(LIBWINEVBS_VERSION))
LIBWINEVBS_LICENSE = LGPL-2.1
LIBWINEVBS_LICENSE_FILES = LICENSE
LIBWINEVBS_DEPENDENCIES =
LIBWINEVBS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBWINEVBS_INSTALL_STAGING = YES

LIBWINEVBS_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
