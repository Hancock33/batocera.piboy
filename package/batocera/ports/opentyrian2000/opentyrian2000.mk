################################################################################
#
# opentyrian2000
#
################################################################################
# Version: Commits on Mar 21, 2022
OPENTYRIAN2000_VERSION = 0c922cc198f1da6d2aa946562c85327f4a3834eb
OPENTYRIAN2000_SITE = $(call github,KScl,opentyrian2000,$(OPENTYRIAN2000_VERSION))

OPENTYRIAN2000_DEPENDENCIES = sdl2 sdl2_mixer sdl2_ttf openal
OPENTYRIAN2000_LICENSE = GPL-2.0

define OPENTYRIAN2000_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) TYRIAN_DIR=/usr/share/tyrian2000
endef

define OPENTYRIAN2000_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/opentyrian2000 -D $(TARGET_DIR)/usr/bin/opentyrian2000
	# download datafiles
	mkdir -p $(@D)/data
	curl -L https://www.camanis.net/tyrian/tyrian2000.zip -o $(@D)/data/tyrian2000.zip
	$(UNZIP) -q $(@D)/data/tyrian2000.zip -d $(TARGET_DIR)/usr/share
	# install media
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/opentyrian
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/opentyrian2000/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/opentyrian/
    # evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/opentyrian2000/opentyrian.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
