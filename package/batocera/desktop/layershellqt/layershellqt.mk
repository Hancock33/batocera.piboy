################################################################################
#
# layershellqt
#
################################################################################
# Version: Commits on Mar 11, 2025
LAYERSHELLQT_VERSION = v6.3.4
LAYERSHELLQT_SITE = $(call github,KDE,layer-shell-qt,$(LAYERSHELLQT_VERSION))
LAYERSHELLQT_LICENSE = GPL-3.0
LAYERSHELLQT_SUPPORTS_IN_SOURCE_BUILD = NO
LAYERSHELLQT_INSTALL_STAGING = YES
LAYERSHELLQT_DEPENDENCIES += host-qt6base host-qt6declarative host-qt6svg
LAYERSHELLQT_DEPENDENCIES += ecm kwindowsystem qt6base qt6declarative qt6svg

$(eval $(cmake-package))
