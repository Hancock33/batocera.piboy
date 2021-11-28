################################################################################
#
# HYDRACASTLELABYRINTH
#
################################################################################
# Version.: Commits on Sept 12, 2021
HCL_VERSION = e112bdb3185bcb314263543aff87db66795f85ff
HCL_SITE = $(call github,ptitSeb,hydracastlelabyrinth,$(HCL_VERSION))

HCL_DEPENDENCIES = sdl2 sdl2_mixer
HCL_LICENSE = GPL-2.0

HCL_SUPPORTS_IN_SOURCE_BUILD = NO

HCL_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DUSE_SDL2=ON

ifeq ($(BR2_PACKAGE_XPI_GAMECON_RPI3)$(BR2_PACKAGE_XPI_GAMECON_RPI4),y)
    HCL_POST_INSTALL_TARGET_HOOKS += HCL_INSTALL_BOOT_PIBOY
else
    HCL_POST_INSTALL_TARGET_HOOKS += HCL_INSTALL_BOOT_X86
endif

define HCL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/hcl
	cp -pvr $(@D)/data $(TARGET_DIR)/usr/share/hcl/
	$(INSTALL) -D $(@D)/buildroot-build/hcl $(TARGET_DIR)/usr/share/hcl/hcl
	chmod 0754 $(TARGET_DIR)/usr/share/hcl/hcl
	echo "cd /usr/share/hcl && ./hcl" > $(TARGET_DIR)/usr/share/hcl/hcl.sh
	chmod 0754 $(TARGET_DIR)/usr/share/hcl/hcl.sh

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/hcl/hcl.keys $(TARGET_DIR)/usr/share/evmapy
endef

define HCL_INSTALL_BOOT_PIBOY
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/hcl/hcl.rpi4 $(TARGET_DIR)/usr/bin/hcl
	chmod 0754 $(TARGET_DIR)/usr/bin/hcl
endef

define HCL_INSTALL_BOOT_X86
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/hcl/hcl.x86 $(TARGET_DIR)/usr/bin/hcl
	chmod 0754 $(TARGET_DIR)/usr/bin/hcl
endef


$(eval $(cmake-package))
