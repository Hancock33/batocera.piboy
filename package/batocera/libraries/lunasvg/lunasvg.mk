################################################################################
#
# lunasvg
#
################################################################################
# Version: Commits on Oct 01, 2024
LUNASVG_VERSION = 70b2fc188ae9628f4313335a0d628eef10c842dd
LUNASVG_SITE = $(call github,stenzek,lunasvg,$(LUNASVG_VERSION))

LUNASVG_LICENSE = BSD-2-Clause
LUNASVG_INSTALL_STAGING = YES
LUNASVG_SUPPORTS_IN_SOURCE_BUILD = NO

LUNASVG_CONF_OPTS += -DLUNASVG_BUILD_EXAMPLES=OFF
LUNASVG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON

$(eval $(cmake-package))
