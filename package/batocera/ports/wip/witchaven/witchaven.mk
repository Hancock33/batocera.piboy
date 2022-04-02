################################################################################
#
# WITCHAVEN
#
################################################################################
# Version: Commits on Jan 26, 2021
WITCHAVEN_VERSION = e0f0791a9d9b95c3ef6b1b48f6ed48517d0e653e
WITCHAVEN_SITE = https://github.com/jonof/jfwhaven.git

WITCHAVEN_DEPENDENCIES = sdl2 sdl2_image
WITCHAVEN_SITE_METHOD=git
WITCHAVEN_GIT_SUBMODULES=YES
WITCHAVEN_LICENSE = GPLv3

WITCHAVEN_CONF_OPTS +=RELEASE=1
WITCHAVEN_CONF_OPTS +=WITHOUT_GTK=1
WITCHAVEN_CONF_OPTS +=DATADIR=/userdata/roms/etekwar

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
WITCHAVEN_CONF_OPTS=USE_OPENGL=1 POLYMER=1
else
WITCHAVEN_CONF_OPTS=USE_OPENGL=USE_GLES2 POLYMER=1
endif

define WITCHAVEN_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f Makefile $(WITCHAVEN_CONF_OPTS)
endef

define WITCHAVEN_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/whaven -D $(TARGET_DIR)/usr/bin/whaven
	# make rom path
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/witchaven
	cp $(@D)/data/*.dat $(TARGET_DIR)/usr/share/batocera/datainit/roms/witchaven/

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/witchaven/witchaven.keys $(TARGET_DIR)/usr/share/evmapy/witchaven.keys
endef

$(eval $(generic-package))

