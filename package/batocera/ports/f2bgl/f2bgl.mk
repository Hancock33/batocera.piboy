################################################################################
#
# Fade To Black
#
################################################################################
# Version.: Commits on Oct 18, 2020
F2BGL_VERSION = 0b84f41c7cc13a41f5a1832549485b814a52070d
F2BGL_SITE = $(call github,cyxx,f2bgl,$(F2BGL_VERSION))

F2BGL_DEPENDENCIES = sdl2 sdl2_mixer freepats
F2BGL_LICENSE = GPLv2

define F2BGL_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D)
endef

define F2BGL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/f2bgl -D $(TARGET_DIR)/usr/bin/f2bgl

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/f2bgl/f2bgl.keys $(TARGET_DIR)/usr/share/evmapy/f2bgl.keys
endef

$(eval $(generic-package))
