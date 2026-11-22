################################################################################
#
# kddockwidgets
#
################################################################################
# Version: Commits on Oct 23, 2026
KDDOCKWIDGETS_VERSION = v2.5.1
KDDOCKWIDGETS_SITE = $(call github,KDAB,KDDockWidgets,$(KDDOCKWIDGETS_VERSION))
KDDOCKWIDGETS_LICENSE = GPL-2.0 or GPL-3.0
KDDOCKWIDGETS_LICENSE_FILES = LICENSE.txt
KDDOCKWIDGETS_SUPPORTS_IN_SOURCE_BUILD = NO
KDDOCKWIDGETS_INSTALL_STAGING = YES
KDDOCKWIDGETS_DEPENDENCIES += qt6base qt6svg qt6tools spdlog fmt json-for-modern-cpp

KDDOCKWIDGETS_CONF_OPTS += -DKDDockWidgets_FRONTENDS=qtwidgets
KDDOCKWIDGETS_CONF_OPTS += -DKDDockWidgets_QT6=ON

$(eval $(cmake-package))
