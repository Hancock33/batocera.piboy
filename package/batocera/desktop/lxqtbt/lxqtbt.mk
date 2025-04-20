################################################################################
#
# lxqtbt
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQTBT_VERSION = 2.2.0
LXQTBT_SITE = $(call github,lxqt,lxqt-build-tools,$(LXQTBT_VERSION))
LXQTBT_LICENSE = BSD-3-Clause
LXQTBT_DEPENDENCIES = qt6base qt6tools
LXQTBT_SUPPORTS_IN_SOURCE_BUILD = NO
LXQTBT_INSTALL_STAGING = YES

LXQTBT_CONF_OPTS += -DQt6CoreTools_DIR=$(HOST_DIR)/lib/cmake/Qt6CoreTools

$(eval $(cmake-package))
