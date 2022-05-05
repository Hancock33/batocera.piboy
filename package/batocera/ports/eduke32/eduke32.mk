################################################################################
#
# EDUKE32
#
################################################################################
# Version: Commits on 05 May, 2022
EDUKE32_VERSION = cb6f5158c35eba81734ff30709f1a25373ad3d35
EDUKE32_SITE = https://voidpoint.io/terminx/eduke32.git

EDUKE32_DEPENDENCIES = sdl2 sdl2_image nblood
EDUKE32_SITE_METHOD=git
EDUKE32_LICENSE = GPLv3

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
EDUKE32_CONF_OPTS=USE_OPENGL=1 POLYMER=1 RPI4=0
else
EDUKE32_CONF_OPTS=USE_OPENGL=0 POLYMER=1 RPI4=1
endif

define EDUKE32_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f GNUmakefile HAVE_GTK2=0 $(EDUKE32_CONF_OPTS)
endef

define EDUKE32_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/eduke32 -D $(TARGET_DIR)/usr/bin/eduke32
	$(INSTALL) -m 0755 $(@D)/voidsw -D $(TARGET_DIR)/usr/bin/voidsw

	#copy sdl game contoller info
	cp $(@D)/package/common/gamecontrollerdb.txt $(TARGET_DIR)/usr/share/gamecontrollerdb.txt
endef

$(eval $(generic-package))
