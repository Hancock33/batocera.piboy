################################################################################
#
# lunasvg
#
################################################################################
# Version: Commits on Mar 30, 2025
LUNASVG_VERSION = 4a1c98ccb1da8a5a92ddc4f97339869b1ae556f4
LUNASVG_SITE = $(call github,stenzek,lunasvg,$(LUNASVG_VERSION))

LUNASVG_LICENSE = BSD-2-Clause
LUNASVG_INSTALL_STAGING = YES
LUNASVG_SUPPORTS_IN_SOURCE_BUILD = NO

LUNASVG_CONF_OPTS += -DLUNASVG_BUILD_EXAMPLES=OFF
LUNASVG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON

$(eval $(cmake-package))
