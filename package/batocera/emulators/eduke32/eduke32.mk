################################################################################
#
# EDUKE32
#
################################################################################
# Version.: Commits on Jul 7, 2021
EDUKE32_VERSION = b10f9112e1558582358a8a7ef208f830134a0a72
EDUKE32_SITE = https://voidpoint.io/terminx/eduke32.git

EDUKE32_DEPENDENCIES = sdl2 sdl2_image
EDUKE32_SITE_METHOD=git
EDUKE32_LICENSE = GPLv3

define EDUKE32_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f GNUmakefile HAVE_GTK2=0 USE_OPENGL=0
endef

define EDUKE32_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/eduke32
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/eduke32/eduke32.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/eduke32
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/eduke32/settings.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/eduke32
	$(INSTALL) -m 0755 $(@D)/eduke32 -D $(TARGET_DIR)/usr/bin/eduke32
	
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/eduke32/eduke32.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
