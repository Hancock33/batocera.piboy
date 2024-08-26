################################################################################
#
# lunasvg
#
################################################################################
# Version: Commits on Aug 25, 2024
LUNASVG_VERSION = 9af1ac7b90658a279b372add52d6f77a4ebb482c
LUNASVG_SITE = $(call github,stenzek,lunasvg,$(LUNASVG_VERSION))

LUNASVG_LICENSE = BSD-2-Clause
LUNASVG_INSTALL_STAGING = YES
LUNASVG_SUPPORTS_IN_SOURCE_BUILD = NO

LUNASVG_CONF_OPTS += -DLUNASVG_BUILD_EXAMPLES=OFF
LUNASVG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON

$(eval $(cmake-package))
