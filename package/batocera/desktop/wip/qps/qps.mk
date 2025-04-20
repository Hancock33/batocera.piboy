################################################################################
#
# qps
#
################################################################################
# Version: Commits on Apr 17, 2025
QPS_VERSION = 2.11.0
QPS_SITE = $(call github,lxqt,qps,$(QPS_VERSION))
QPS_LICENSE = BSD-3-Clause
QPS_SUPPORTS_IN_SOURCE_BUILD = NO
QPS_INSTALL_STAGING = YES
QPS_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
