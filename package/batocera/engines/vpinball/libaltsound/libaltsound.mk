################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on May 17, 2026
LIBALTSOUND_VERSION = e150382209750393e2b166b4ed93b2105548cb60
LIBALTSOUND_SITE = $(call github,vpinball,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = BSD-3-Clause
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_INSTALL_STAGING = YES

LIBALTSOUND_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)


$(eval $(cmake-package))
