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

define WITCHAVEN_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f Makefile $(WITCHAVEN_CONF_OPTS) HAVE_GTK=0 DATADIR=/userdata/roms/witchaven USE_POLYMOST=0 USE_OPENGL=0
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
