################################################################################
#
# abuse
#
################################################################################
# Version: Commits on Jan 28, 2025
ABUSE_VERSION = 5a43f974ad8d534ab5b7869eadda4eae69002050
ABUSE_SITE = $(call github,apancik,Abuse_2025,$(ABUSE_VERSION))
ABUSE_DEPENDENCIES = sdl2 sdl2_mixer
ABUSE_SUPPORTS_IN_SOURCE_BUILD = NO

ABUSE_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
ABUSE_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define ABUSE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/abuse $(TARGET_DIR)/usr/bin/abuse
endef

$(eval $(cmake-package))
