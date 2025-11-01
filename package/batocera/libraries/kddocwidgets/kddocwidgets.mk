################################################################################
#
# kddocwidgets
#
################################################################################
# Version: Commits on Oct 31, 2025
KDDOCWIDGETS_VERSION = v2.4.0
KDDOCWIDGETS_SITE = $(call github,KDAB,KDDockWidgets,$(KDDOCWIDGETS_VERSION))
KDDOCWIDGETS_LICENSE = GPL-2
KDDOCWIDGETS_SUPPORTS_IN_SOURCE_BUILD = NO
KDDOCWIDGETS_INSTALL_STAGING = YES
KDDOCWIDGETS_DEPENDENCIES += qt6base qt6svg qt6tools spdlog fmt json-for-modern-cpp

KDDOCWIDGETS_CONF_OPTS += -DKDDockWidgets_FRONTENDS=qtwidgets
KDDOCWIDGETS_CONF_OPTS += -DKDDockWidgets_QT6=ON

$(eval $(cmake-package))
