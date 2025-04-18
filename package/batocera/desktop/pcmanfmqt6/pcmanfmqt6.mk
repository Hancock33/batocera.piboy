################################################################################
#
# pcmanfmqt6
#
################################################################################
# Version: Commits on Apr 17, 2025
PCMANFMQT6_VERSION = 2.2.0
PCMANFMQT6_SITE = $(call github,lxqt,pcmanfm-qt,$(PCMANFMQT6_VERSION))
PCMANFMQT6_LICENSE =  GPL-3.0
PCMANFMQT6_SUPPORTS_IN_SOURCE_BUILD = NO
PCMANFMQT6_INSTALL_STAGING = YES
PCMANFMQT6_DEPENDENCIES += qt6base layershellqt libexif libfmqt6 liblxqt lxqtmenudata

PCMANFMQT6_CONF_OPTS += -DQt6LinguistTools_DIR=$(HOST_DIR)/lib/cmake/Qt6LinguistTools

$(eval $(cmake-package))
