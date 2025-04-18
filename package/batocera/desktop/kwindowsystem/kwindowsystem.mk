################################################################################
#
# kwindowsystem
#
################################################################################
# Version: Commits on Mar 31, 2025
KWINDOWSYSTEM_VERSION = v6.13.0
KWINDOWSYSTEM_SITE = $(call github,KDE,kwindowsystem,$(KWINDOWSYSTEM_VERSION))
KWINDOWSYSTEM_LICENSE = GPL-3.0
KWINDOWSYSTEM_SUPPORTS_IN_SOURCE_BUILD = NO
KWINDOWSYSTEM_INSTALL_STAGING = YES
KWINDOWSYSTEM_DEPENDENCIES += host-qt6base host-qt6declarative host-qt6svg
KWINDOWSYSTEM_DEPENDENCIES += ecm qt6base qt6declarative qt6svg

KWINDOWSYSTEM_CONF_OPTS += -DKWINDOWSYSTEM_WAYLAND=OFF

$(eval $(cmake-package))
