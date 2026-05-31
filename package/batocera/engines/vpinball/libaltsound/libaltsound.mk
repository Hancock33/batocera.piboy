################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on May 31, 2026
LIBALTSOUND_VERSION = b9c0ca1f0444a687a218c93d1c4d3ffa8680311f
LIBALTSOUND_SITE = $(call github,vpinball,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = BSD-3-Clause
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_INSTALL_STAGING = YES

LIBALTSOUND_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)


$(eval $(cmake-package))
