################################################################################
#
# abuse
#
################################################################################
# Version: Commits on Jan 17, 2025
ABUSE_VERSION = 2025.1.0
ABUSE_SITE = $(call github,apancik,Abuse_2025,$(ABUSE_VERSION))
ABUSE_DEPENDENCIES = sdl2 sdl2_mixer
ABUSE_SUPPORTS_IN_SOURCE_BUILD = NO
ABUSE_CONF_OPTS += -DASSETDIR=/usr/share/abuse

define ABUSE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/abuse $(TARGET_DIR)/usr/bin/abuse
endef

$(eval $(cmake-package))
