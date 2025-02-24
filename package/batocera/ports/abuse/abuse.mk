################################################################################
#
# abuse
#
################################################################################
# Version: Commits on Jan 17, 2025
ABUSE_VERSION = 2025.1.0
ABUSE_SITE = $(call github,apancik,Abuse_2025,$(ABUSE_VERSION))
ABUSE_EXTRA_DOWNLOADS = http://abuse.zoy.org/raw-attachment/wiki/download/abuse-data-2.00.tar.gz

ABUSE_DEPENDENCIES = sdl2 sdl2_mixer
ABUSE_SUPPORTS_IN_SOURCE_BUILD = NO
ABUSE_CONF_OPTS += -DASSETDIR=/usr/share/abuse
ABUSE_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define ABUSE_INSTALL_TARGET_CMDS
	# install game data
	mkdir -p $(TARGET_DIR)/usr/share/abuse/
	tar -xf $(ABUSE_DL_DIR)/abuse-data-2.00.tar.gz -C $(TARGET_DIR)/usr/share/abuse/
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/abuse $(TARGET_DIR)/usr/bin/abuse
	cp -pvr $(@D)/data/* $(TARGET_DIR)/usr/share/abuse
	rm $(TARGET_DIR)/usr/share/abuse/CMakeLists.txt
	rm $(TARGET_DIR)/usr/share/abuse/READMD.md
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/abuse
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/abuse/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/abuse/
endef

$(eval $(cmake-package))
