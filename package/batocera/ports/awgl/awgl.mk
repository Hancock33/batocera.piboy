################################################################################
#
# Another World
#
################################################################################
# Version.: Commits on Apr 18, 2020
AWGL_VERSION = 071d98199ec88e5bbc69aa5e7c6a1be1de075e81
AWGL_SITE = $(call github,cyxx,rawgl,$(AWGL_VERSION))

AWGL_DEPENDENCIES = sdl2 sdl2_mixer
AWGL_LICENSE = GPLv2

define AWGL_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D)
endef

define AWGL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/rawgl -D $(TARGET_DIR)/usr/bin/awgl

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/awgl/awgl.keys $(TARGET_DIR)/usr/share/evmapy/awgl.keys
endef

$(eval $(generic-package))
