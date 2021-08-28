################################################################################
#
# EDUKE32
#
################################################################################
# Version.: Commits on Aug 26, 2021
EDUKE32_VERSION = fbcb9839404b06cfe76c6c8c277bcc7843d692da
EDUKE32_SITE = https://voidpoint.io/terminx/eduke32.git

EDUKE32_DEPENDENCIES = sdl2 sdl2_image
EDUKE32_SITE_METHOD=git
EDUKE32_LICENSE = GPLv3

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
EDUKE32_CONF_OPTS=USE_OPENGL=1 POLYMER=1
else
EDUKE32_CONF_OPTS=USE_OPENGL=0
endif

define EDUKE32_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f GNUmakefile HAVE_GTK2=0 $(EDUKE32_CONF_OPTS)
endef

define EDUKE32_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/eduke32
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/eduke32/eduke32.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/eduke32
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/eduke32/settings.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/eduke32
	$(INSTALL) -m 0755 $(@D)/eduke32 -D $(TARGET_DIR)/usr/bin/eduke32

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/eduke32/eduke32.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
