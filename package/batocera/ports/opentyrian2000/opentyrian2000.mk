################################################################################
#
# opentyrian2000
#
################################################################################
# Version: Commits on May 16, 2024
OPENTYRIAN2000_VERSION = 0bfca44a932fb6ad255d76cd2eda5fcbc2b01940
OPENTYRIAN2000_SITE = $(call github,KScl,opentyrian2000,$(OPENTYRIAN2000_VERSION))

OPENTYRIAN2000_DEPENDENCIES = sdl2 sdl2_mixer sdl2_ttf openal
OPENTYRIAN2000_LICENSE = GPL-2.0
OPENTYRIAN2000_EXTRA_DOWNLOADS = https://www.camanis.net/tyrian/tyrian2000.zip

define OPENTYRIAN2000_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
	CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
	-C $(@D) TYRIAN_DIR=/usr/share/tyrian2000
endef

define OPENTYRIAN2000_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/opentyrian2000 -D $(TARGET_DIR)/usr/bin/opentyrian2000
	# download datafiles
	$(UNZIP) -o $(OPENTYRIAN2000_DL_DIR)/tyrian2000.zip -d $(TARGET_DIR)/usr/share
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/opentyrian
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/opentyrian2000/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/opentyrian/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/opentyrian2000/opentyrian.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
