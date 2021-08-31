################################################################################
#
# IONFURY
#
################################################################################
# Version.: Commits on Aug 26, 2021
IONFURY_VERSION = fbcb9839404b06cfe76c6c8c277bcc7843d692da
IONFURY_SITE = https://voidpoint.io/terminx/eduke32.git

IONFURY_DEPENDENCIES = sdl2 sdl2_image
IONFURY_SITE_METHOD=git
IONFURY_LICENSE = GPLv3

IONFURY_CONF_OPTS=USE_OPENGL=1

define IONFURY_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f GNUmakefile HAVE_GTK2=0 FURY=1 $(IONFURY_CONF_OPTS)
endef

define IONFURY_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/fury
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/ionfury/ionfury.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/fury
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/ionfury/settings.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.config/fury
	$(INSTALL) -m 0755 $(@D)/fury -D $(TARGET_DIR)/usr/bin/ionfury

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/ionfury/ionfury.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
