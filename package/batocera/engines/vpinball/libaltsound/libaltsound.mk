################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on Oct 07, 2026
LIBALTSOUND_VERSION = f908262d334af9413ff70caa5961f4a331080920
LIBALTSOUND_SITE = $(call github,vpinball,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = BSD-3-Clause
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_INSTALL_STAGING = YES

LIBALTSOUND_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)


$(eval $(cmake-package))
