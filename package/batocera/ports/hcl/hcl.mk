################################################################################
#
# HYDRACASTLELABYRINTH
#
################################################################################
# Version.: Commits on Apr 16, 2021
HCL_VERSION = ab43945c27577a418636c92f9ae2a44ce9588f0b
HCL_SITE = $(call github,ptitSeb,hydracastlelabyrinth,$(HCL_VERSION))

HCL_DEPENDENCIES = sdl2 sdl2_mixer
HCL_LICENSE = GPL-2.0

HCL_SUPPORTS_IN_SOURCE_BUILD = NO

HCL_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DUSE_SDL2=ON
HCL_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -fcommon -L$(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/lib -lSDL2"
HCL_CONF_OPTS += -DCMAKE_LD_FLAGS="$(TARGET_LDFLAGS) -L$(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/lib -lSDL2"

define HCL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/hcl
	$(INSTALL) -D $(@D)/buildroot-build/hcl $(TARGET_DIR)/usr/share/hcl/hcl
	chmod 0755 $(TARGET_DIR)/usr/share/hcl/hcl
    cp -pvr $(@D)/data $(TARGET_DIR)/usr/share/hcl/

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/hcl/hcl.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
