################################################################################
#
# cannonball
#
################################################################################
# Version: Commits on Jan 30, 2022
CANNONBALL_VERSION = 27493ebf62be3498dff93ed6a45e8e2db819bae1
CANNONBALL_SITE = $(call github,djyt,cannonball,$(CANNONBALL_VERSION))
CANNONBALL_LICENSE = GPLv2
CANNONBALL_DEPENDENCIES = sdl2 boost
CANNONBALL_SUPPORTS_IN_SOURCE_BUILD = NO
CANNONBALL_SUBDIR = cmake
CANNONBALL_TARGET = linux.cmake

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI1),y)
CANNONBALL_TARGET = pi-opengles.camke
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI2),y)
CANNONBALL_TARGET = pi-opengles.cmake
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3)$(BR2_PACKAGE_BATOCERA_TARGET_RPIZERO2),y)
CANNONBALL_TARGET = pi-opengles.camke
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
CANNONBALL_TARGET = pi-opengl.cmake
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86),y)
CANNONBALL_TARGET = linux.cmake
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64),y)
CANNONBALL_TARGET = linux.cmake
endif

# Build as release with proper target and paths
CANNONBALL_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DTARGET=$(CANNONBALL_TARGET)

# Cannonball cmake files are hopelessly broken.
# Link libmali manually. Ideally we should fix cannonball to use pkg-config instead.
ifeq ($(BR2_PACKAGE_HAS_LIBMALI),y)
CANNONBALL_EXE_LINKER_FLAGS += -lmali
CANNONBALL_SHARED_LINKER_FLAGS += -lmali
endif

# Enabling LTO as hires mode tends to be slow, it does help video rendering loops
CANNONBALL_EXE_LINKER_FLAGS += -flto
CANNONBALL_SHARED_LINKER_FLAGS += -flto
CANNONBALL_CONF_OPTS += -DCMAKE_CXX_FLAGS=-flto -DCMAKE_EXE_LINKER_FLAGS="$(CANNONBALL_EXE_LINKER_FLAGS)" -DCMAKE_SHARED_LINKER_FLAGS="$(CANNONBALL_SHARED_LINKER_FLAGS)"

define CANNONBALL_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/cmake/buildroot-build/cannonball $(TARGET_DIR)/usr/bin/
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/cannonball/res/
	$(INSTALL) -D $(@D)/cmake/buildroot-build/res/tilemap.bin $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/cannonball/
	$(INSTALL) -D $(@D)/cmake/buildroot-build/res/tilepatch.bin $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/cannonball/
	$(INSTALL) -D $(@D)/cmake/buildroot-build/config.xml $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/cannonball/config_help.txt
endef

$(eval $(cmake-package))
