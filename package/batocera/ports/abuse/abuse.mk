################################################################################
#
# abuse
#
################################################################################
# Version: Commits on Oct 27, 2022
ABUSE_VERSION = 9d1f66f57377859bae10e28eabebea0b9c750490
ABUSE_SITE = $(call github,Xenoveritas,abuse,$(ABUSE_VERSION))

ABUSE_DEPENDENCIES = sdl2 sdl2_mixer abuse-data host-ninja
ABUSE_SUPPORTS_IN_SOURCE_BUILD = NO
ABUSE_CONF_OPTS += -DASSETDIR=/usr/share/abuse -GNinja

define ABUSE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(ABUSE_BUILDDIR)
endef

define ABUSE_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/abuse
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/abuse $(TARGET_DIR)/usr/bin/abuse
	cp -pvr $(@D)/data/* $(TARGET_DIR)/usr/share/abuse
	rm $(TARGET_DIR)/usr/share/abuse/CMakeLists.txt
	rm $(TARGET_DIR)/usr/share/abuse/READMD.md
	# install media
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/abuse
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/abuse/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/abuse/
endef

$(eval $(cmake-package))
