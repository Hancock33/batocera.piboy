################################################################################
#
# quake3
#
################################################################################
# Version: Commits on Jul 27, 2024
QUAKE3_VERSION = 4c19ff2b55e6dd3d97c681112821de0556f78d4a
QUAKE3_SITE = $(call github,ioquake,ioq3,$(QUAKE3_VERSION))
QUAKE3_LICENSE = GPL-2.0
QUAKE3_LICENSE_FILE = COPYING.txt

QUAKE3_DEPENDENCIES = sdl2

QUAKE3_BUILD_ARGS += BUILD_SERVER=0
QUAKE3_BUILD_ARGS += BUILD_CLIENT=1
QUAKE3_BUILD_ARGS += BUILD_BASEGAME=1
QUAKE3_BUILD_ARGS += BUILD_MISSIONPACK=1
QUAKE3_BUILD_ARGS += BUILD_GAME_SO=0
QUAKE3_BUILD_ARGS += BUILD_GAME_QVM=0
QUAKE3_BUILD_ARGS += CROSS_COMPILING=1
QUAKE3_BUILD_ARGS += USE_RENDERER_DLOPEN=0
QUAKE3_BUILD_ARGS += OPTIMIZE="$(TARGET_OPTIMIZATION)"

ifeq ($(BR2_PACKAGE_GL4ES),y)
	QUAKE3_DEPENDENCIES += gl4es
endif

ifeq ($(BR2_aarch64),y)
	QUAKE3_BUILD_ARGS += COMPILE_ARCH=arm64
else ifeq ($(BR2_arm),y)
	QUAKE3_BUILD_ARGS += COMPILE_ARCH=armv7l
else ifeq ($(BR2_x86_64),y)
	QUAKE3_BUILD_ARGS += COMPILE_ARCH=x86_64
endif

define QUAKE3_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile \
	DEFAULT_BASEDIR=/userdata/roms/ports/quake3 \
	$(QUAKE3_BUILD_ARGS) -C $(@D) -f Makefile
endef

define QUAKE3_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/quake3
	cp -pvr $(@D)/build/release-linux-*/ioquake3_opengl2.* $(TARGET_DIR)/usr/bin/ioquake3
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/quake3/quake3.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
