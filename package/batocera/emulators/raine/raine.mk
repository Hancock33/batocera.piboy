################################################################################
#
# raine
#
################################################################################
# Version.: Commits on Feb 18, 2022
RAINE_VERSION = 14ba8ac8c40d3a5072ff223c616ec98a73f936dd
RAINE_SITE = $(call github,zelurker,raine,$(RAINE_VERSION))
RAINE_LICENSE = BSD
RAINE_DEPENDENCIES = sdl2 sdl2_net sdl2_image sdl2_ttf muparser

define RAINE_BUILD_CMDS
	cd $(@D); \
	PATH="$(STAGING_DIR)/usr/bin:$(HOST_DIR)/bin:$$PATH" \
	LDFLAGS="--sysroot=$(STAGING_DIR)" \
	CFLAGS="--sysroot=$(STAGING_DIR)" \
	CXXFLAGS="--sysroot=$(STAGING_DIR)" \
	$(MAKE) \
	CC="$(TARGET_CC)" \
	CXX="$(TARGET_CXX)" \
	LD="$(TARGET_LD)" \
	AR="$(TARGET_AR)" \
	STRIP="$(TARGET_STRIP)" \
	CROSSCOMPILE=1 \
	NO_ASM=1 \
	NATIVE=$(@D)/linux-gnu-sdl2 \
	CPU=cortex-a72 
endef

define RAINE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	$(INSTALL) -D $(@D)/raine $(TARGET_DIR)/usr/bin/raine
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/raine/raine.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
