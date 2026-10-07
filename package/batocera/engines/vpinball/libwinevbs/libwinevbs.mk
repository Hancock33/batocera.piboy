################################################################################
#
# libwinevbs
#
################################################################################
# Version: Commits on Sept 15, 2026
LIBWINEVBS_VERSION = 7ed9258b68010581b90e242be91057c0f7e99971
LIBWINEVBS_SITE = $(call github,vpinball,libwinevbs,$(LIBWINEVBS_VERSION))
LIBWINEVBS_LICENSE = LGPL-2.1
LIBWINEVBS_LICENSE_FILES = LICENSE
LIBWINEVBS_DEPENDENCIES =
LIBWINEVBS_SUPPORTS_IN_SOURCE_BUILD = NO
LIBWINEVBS_INSTALL_STAGING = YES

LIBWINEVBS_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
