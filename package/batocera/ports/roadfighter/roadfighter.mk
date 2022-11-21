################################################################################
#
# roadfighter
#
################################################################################
# Version: Commits on Aug 01, 2022
ROADFIGHTER_VERSION = fd3e1ec14d6b84c408dca50081da0a61f8a4f73d
ROADFIGHTER_SITE = $(call github,ptitSeb,roadfighter,$(ROADFIGHTER_VERSION))
ROADFIGHTER_DEPENDENCIES = sdl2-compat

define ROADFIGHTER_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile
endef

define ROADFIGHTER_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/roadfighter
	$(INSTALL) -m 0755 $(@D)/roadfighter -D $(TARGET_DIR)/usr/share/roadfighter
	cp -av $(@D)/{fonts,graphics,maps,sound} $(TARGET_DIR)/usr/share/roadfighter
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/roadfighter/roadfighter.keys $(TARGET_DIR)/usr/share/evmapy/roadfighter.keys
endef

$(eval $(generic-package))
