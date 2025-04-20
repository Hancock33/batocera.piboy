################################################################################
#
# qtxdg-tools
#
################################################################################
# Version: Commits on Apr 17, 2025
QTXDG_TOOLS_VERSION = 4.2.0
QTXDG_TOOLS_SITE = $(call github,lxqt,qtxdg-tools,$(QTXDG_TOOLS_VERSION))
QTXDG_TOOLS_LICENSE = BSD-3-Clause
QTXDG_TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
QTXDG_TOOLS_INSTALL_STAGING = YES
QTXDG_TOOLS_DEPENDENCIES += qt6base libqtxdg

$(eval $(cmake-package))
