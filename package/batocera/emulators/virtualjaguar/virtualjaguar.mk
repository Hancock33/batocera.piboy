################################################################################
#
# Virtual-Jaguar
#
################################################################################
# Version: Commits on May 28, 2019
VIRTUALJAGUAR_VERSION = 66d2d56317b39b5bde65209865c64ca072b6f83d
VIRTUALJAGUAR_SITE = $(call github,gameblabla,virtualjaguar-sdl,$(VIRTUALJAGUAR_VERSION))

VIRTUALJAGUAR_LICENSE = GPL-3.0
VIRTUALJAGUAR_DEPENDENCIES = sdl2-compat

define VIRTUALJAGUAR_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -j1 CXX="$(TARGET_CXX)" CC="$(TARGET_CC)"  LD="$(TARGET_CC)" -C $(@D)/ -f Makefile
endef

define VIRTUALJAGUAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/virtualjaguar -D $(TARGET_DIR)/usr/bin/virtualjaguar
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/virtualjaguar/jaguar.virtualjaguar.keys $(TARGET_DIR)/usr/share/evmapy/jaguar.virtualjaguar.keys
endef

$(eval $(generic-package))
