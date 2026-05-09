################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on May 08, 2026
LIBALTSOUND_VERSION = 2fae9021ce2a783dddc4ded3cdf46428dfe7490b
LIBALTSOUND_SITE = $(call github,vpinball,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = BSD-3-Clause
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_INSTALL_STAGING = YES

LIBALTSOUND_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)


$(eval $(cmake-package))
