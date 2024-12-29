################################################################################
#
# quake3
#
################################################################################
# Version: Commits on Dec 24, 2024
QUAKE3_VERSION = 3fb9006e6461b877b67781cd0f0d94032804a475
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
QUAKE3_BUILD_ARGS += USE_RENDERER_DLOPEN=1
QUAKE3_BUILD_ARGS += OPTIMIZE="$(TARGET_OPTIMIZATION)"

ifeq ($(BR2_aarch64),y)
    IOQUAKE3_BUILD_ARGS += COMPILE_ARCH=arm64
    IOQUAKE3_ARCH = arm64
else ifeq ($(BR2_arm),y)
    IOQUAKE3_BUILD_ARGS += COMPILE_ARCH=armv7l
    IOQUAKE3_ARCH = armv7l
else ifeq ($(BR2_x86_64),y)
    IOQUAKE3_BUILD_ARGS += COMPILE_ARCH=x86_64
    IOQUAKE3_ARCH = x86_64
else ifeq ($(BR2_RISCV_64),y)
    IOQUAKE3_BUILD_ARGS += COMPILE_ARCH=riscv64
    IOQUAKE3_ARCH = riscv64
endif

define QUAKE3_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" DEFAULT_BASEDIR=/userdata/roms/ports/quake3 $(IOQUAKE3_BUILD_ARGS) SYSROOT=$(STAGING_DIR) -C $(@D) -f Makefile
endef

define QUAKE3_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/quake3
	$(INSTALL) -D $(@D)/build/release-linux-$(IOQUAKE3_ARCH)/ioquake3.$(IOQUAKE3_ARCH) $(TARGET_DIR)/usr/bin/quake3/ioquake3
	$(INSTALL) -D $(@D)/build/release-linux-$(IOQUAKE3_ARCH)/renderer_opengl1_$(IOQUAKE3_ARCH).so $(TARGET_DIR)/usr/bin/quake3/
	$(INSTALL) -D $(@D)/build/release-linux-$(IOQUAKE3_ARCH)/renderer_opengl2_$(IOQUAKE3_ARCH).so $(TARGET_DIR)/usr/bin/quake3/
endef

define QUAKE3_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/quake3/quake3.keys $(TARGET_DIR)/usr/share/evmapy
endef

QUAKE3_POST_INSTALL_TARGET_HOOKS += QUAKE3_EVMAPY

$(eval $(generic-package))
