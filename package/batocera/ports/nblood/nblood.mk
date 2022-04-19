################################################################################
#
# NBLOOD
#
################################################################################
# Version: Commits on Apr 19, 2022
NBLOOD_VERSION = 9cabb6e68a5dbe51f906ac583e6b7b53f5c9c65e
NBLOOD_SITE = https://github.com/nukeykt/NBlood.git

NBLOOD_DEPENDENCIES = sdl2 sdl2_image
NBLOOD_SITE_METHOD=git
NBLOOD_LICENSE = GPLv3

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
NBLOOD_CONF_OPTS=USE_OPENGL=1 POLYMER=1 RPI4=0
else
NBLOOD_CONF_OPTS=USE_OPENGL=0 POLYMER=1 RPI4=1
endif

define NBLOOD_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f GNUmakefile HAVE_GTK2=0 $(NBLOOD_CONF_OPTS)
endef

define NBLOOD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/nblood -D $(TARGET_DIR)/usr/bin/nblood
	$(INSTALL) -m 0755 $(@D)/pcexhumed -D $(TARGET_DIR)/usr/bin/pcexhumed
	$(INSTALL) -m 0755 $(@D)/rednukem -D $(TARGET_DIR)/usr/bin/rednukem
endef

$(eval $(generic-package))
