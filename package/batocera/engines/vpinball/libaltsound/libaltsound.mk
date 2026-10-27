################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on Oct 25, 2026
LIBALTSOUND_VERSION = 62914678c532ff06a245e9360fce6d5d28804eee
LIBALTSOUND_SITE = $(call github,vpinball,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = BSD-3-Clause
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_INSTALL_STAGING = YES

LIBALTSOUND_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
