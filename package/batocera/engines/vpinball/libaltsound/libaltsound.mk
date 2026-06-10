################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on Jun 10, 2026
LIBALTSOUND_VERSION = f4b790a19ae45a9f93ae0051df6933800c7a6446
LIBALTSOUND_SITE = $(call github,vpinball,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = BSD-3-Clause
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_INSTALL_STAGING = YES

LIBALTSOUND_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)


$(eval $(cmake-package))
