################################################################################
#
# Stunt Car Racer Remake
#
################################################################################
# Version: Commits on Jul 18, 2021
STUNTCAR_VERSION = f90f3851a44872c874baade0aad7206ce860f1c8
STUNTCAR_SITE = $(call github,ptitSeb,stuntcarremake,$(STUNTCAR_VERSION))

STUNTCAR_DEPENDENCIES = sdl2 sdl2_mixer sdl2_ttf openal
STUNTCAR_LICENSE = GPL-2.0

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
STUNTCAR_CONF_OPTS=LINUX=1
else
STUNTCAR_CONF_OPTS=RPI4=1
endif

define STUNTCAR_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		LDFLAGS="-L$(STAGING_DIR)/lib64 -lm -L$(STAGING_DIR)/usr/lib -lSDL2 -lSDL2_mixer -lSDL2_ttf -lGL" \
		-C $(@D) -f Makefile SDL=2 $(STUNTCAR_CONF_OPTS)
endef

define STUNTCAR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/stuntcar
	$(INSTALL) -D $(@D)/stuntcarracer $(TARGET_DIR)/usr/share/stuntcar/stuntcar
	chmod 0754 $(TARGET_DIR)/usr/share/stuntcar/stuntcar
    cp -av $(@D)/Bitmap $(TARGET_DIR)/usr/share/stuntcar/
    cp -av $(@D)/Sounds $(TARGET_DIR)/usr/share/stuntcar/
    cp -av $(@D)/Tracks $(TARGET_DIR)/usr/share/stuntcar/
	cp -av $(@D)/DejaVuSans-Bold.ttf $(TARGET_DIR)/usr/share/stuntcar/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stuntcar/stuntcar.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
