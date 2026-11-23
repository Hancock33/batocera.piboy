################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on Nov 23, 2026
LIBALTSOUND_VERSION = d1af7d8f83dbd22885f9ca548413b65ffb5dad3d
LIBALTSOUND_SITE = $(call github,vpinball,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = BSD-3-Clause
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_INSTALL_STAGING = YES

LIBALTSOUND_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
