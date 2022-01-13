################################################################################
#
# Another World
#
################################################################################
# Version.: Commits on Jan 13, 2022
AWGL_VERSION = 733c41a75e7bde37938c49908fb35c9fc183aed2
AWGL_SITE = $(call github,cyxx,rawgl,$(AWGL_VERSION))

AWGL_DEPENDENCIES = sdl2 sdl2_mixer freepats
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
