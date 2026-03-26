################################################################################
#
# abuse
#
################################################################################
# Version: Commits on Mar 25, 2026
ABUSE_VERSION = 48bc0d079116c6429989bcf88595ef20c5c1b80f
ABUSE_SITE = $(call github,apancik,Abuse_2025,$(ABUSE_VERSION))
ABUSE_EMULATOR_INFO = abuse.emulator.yml
ABUSE_DEPENDENCIES = sdl2 sdl2_mixer
ABUSE_SUPPORTS_IN_SOURCE_BUILD = NO

ABUSE_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
ABUSE_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define ABUSE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/abuse $(TARGET_DIR)/usr/bin/abuse
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
