################################################################################
#
# libqtxdg
#
################################################################################
# Version: Commits on Apr 17, 2025
LIBQTXDG_VERSION = 4.2.0
LIBQTXDG_SITE = $(call github,lxqt,libqtxdg,$(LIBQTXDG_VERSION))
LIBQTXDG_LICENSE = BSD-3-Clause
LIBQTXDG_SUPPORTS_IN_SOURCE_BUILD = NO
LIBQTXDG_INSTALL_STAGING = YES
LIBQTXDG_DEPENDENCIES += lxqtbt libxkbcommon qt6base qt6svg

LIBQTXDG_CONF_OPTS += -DQTXDGX_ICONENGINEPLUGIN_INSTALL_PATH=/usr/lib/qt6/plugins/iconengines

$(eval $(cmake-package))
