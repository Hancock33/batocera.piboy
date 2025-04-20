################################################################################
#
# lxqt_runner
#
################################################################################
# Version: Commits on Apr 17, 2025
LXQT_RUNNER_VERSION = 2.2.0
LXQT_RUNNER_SITE = $(call github,lxqt,lxqt-runner,$(LXQT_RUNNER_VERSION))
LXQT_RUNNER_LICENSE = BSD-3-Clause
LXQT_RUNNER_SUPPORTS_IN_SOURCE_BUILD = NO
LXQT_RUNNER_INSTALL_STAGING = YES
LXQT_RUNNER_DEPENDENCIES += kwindowsystem qtxdg-tools polkitqt

$(eval $(cmake-package))
