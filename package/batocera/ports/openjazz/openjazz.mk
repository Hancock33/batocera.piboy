################################################################################
#
# OPENJAZZ
#
################################################################################
# Version: Commits on Apr 10, 2022
OPENJAZZ_VERSION = 71c106804a382565e4152d709b583e3003fab12d
OPENJAZZ_SITE =  $(call github,AlisterT,openjazz,$(OPENJAZZ_VERSION))

OPENJAZZ_DEPENDENCIES = sdl
OPENJAZZ_LICENSE = GPLv2

define OPENJAZZ_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f Makefile
endef

define OPENJAZZ_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/OpenJazz $(TARGET_DIR)/usr/bin/OpenJazz
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openjazz/openjazz.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/openjazz.cfg
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openjazz/openjazz.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
