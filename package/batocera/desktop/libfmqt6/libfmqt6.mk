################################################################################
#
# libfmqt6
#
################################################################################
# Version: Commits on Apr 17, 2025
LIBFMQT6_VERSION = 2.2.0
LIBFMQT6_SITE = $(call github,lxqt,libfm-qt,$(LIBFMQT6_VERSION))
LIBFMQT6_LICENSE =  GPL-3.0
LIBFMQT6_SUPPORTS_IN_SOURCE_BUILD = NO
LIBFMQT6_INSTALL_STAGING = YES
LIBFMQT6_DEPENDENCIES += qt6base libexif liblxqt lxqtmenudata

LIBFMQT6_CONF_OPTS += -DQt6LinguistTools_DIR=$(HOST_DIR)/lib/cmake/Qt6LinguistTools

$(eval $(cmake-package))
