################################################################################
#
# OPENJAZZ
#
################################################################################
# Version.: Commits on Aug 21, 2021
OPENJAZZ_VERSION = ff36254abe1c094f69e445e698c043aeb1d577cd
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
endef

define OPENJAZZ_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy 
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openjazz/openjazz.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))

