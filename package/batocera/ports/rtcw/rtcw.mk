################################################################################
#
# rtcw
#
################################################################################
# Version: Commits on May 26, 2024
RTCW_VERSION = 438e7d413b5f7277187c35b032eb0ef9093ae778
RTCW_SITE = $(call github,iortcw,iortcw,$(RTCW_VERSION))
RTCW_LICENSE = GPL-3.0
RTCW_LICENSE_FILE = COPYING
RTCW_EMULATOR_INFO = rtcw.emulator.yml
RTCW_DEPENDENCIES = sdl2 openal

# Common args
RTCW_BUILD_ARGS += BUILD_SERVER=0
RTCW_BUILD_ARGS += BUILD_CLIENT=1
RTCW_BUILD_ARGS += BUILD_BASEGAME=1
RTCW_BUILD_ARGS += BUILD_GAME_SO=1
RTCW_BUILD_ARGS += BUILD_GAME_QVM=0
RTCW_BUILD_ARGS += CROSS_COMPILING=1
RTCW_BUILD_ARGS += USE_RENDERER_DLOPEN=1
RTCW_BUILD_ARGS += USE_LOCAL_HEADERS=1
RTCW_BUILD_ARGS += USE_INTERNAL_JPEG=1
RTCW_BUILD_ARGS += USE_INTERNAL_OPUS=1
RTCW_BUILD_ARGS += USE_INTERNAL_ZLIB=1
RTCW_BUILD_ARGS += USE_OPENAL=1
RTCW_BUILD_ARGS += USE_OPENAL_DLOPEN=1
RTCW_BUILD_ARGS += USE_XDG=1
RTCW_BUILD_ARGS += DEFAULT_BASEDIR=/userdata/roms/ports/rtcw

# to be investigated
RTCW_BUILD_ARGS += USE_CODEC_VORBIS=0
RTCW_BUILD_ARGS += USE_CODEC_OPUS=0
RTCW_BUILD_ARGS += USE_CURL=0
RTCW_BUILD_ARGS += USE_CURL_DLOPEN=0
RTCW_BUILD_ARGS += USE_VOIP=0
RTCW_BUILD_ARGS += USE_BLOOM=0
RTCW_BUILD_ARGS += USE_MUMBLE=0
RTCW_BUILD_ARGS += BUILD_RENDERER_REND2=0

ifeq ($(BR2_x86_64),y)
    RTCW_BUILD_ARGS += COMPILE_ARCH=x86_64
    RTCW_ARCH = x86_64
    RTCW_BUILD_ARGS += USE_VOIP=1
    RTCW_BUILD_ARGS += USE_CODEC_VORBIS=1
    RTCW_BUILD_ARGS += USE_CODEC_OPUS=1
    RTCW_BUILD_ARGS += USE_BLOOM=1
    RTCW_BUILD_ARGS += USE_MUMBLE=1
    RTCW_BUILD_ARGS += BUILD_RENDERER_REND2=1
else ifeq ($(BR2_aarch64),y)
    RTCW_BUILD_ARGS += COMPILE_ARCH=arm64
    RTCW_ARCH = arm64
    RTCW_BUILD_ARGS += USE_VOIP=0
    RTCW_BUILD_ARGS += USE_CODEC_VORBIS=0
    RTCW_BUILD_ARGS += USE_CODEC_OPUS=0
    RTCW_BUILD_ARGS += USE_CURL=0
    RTCW_BUILD_ARGS += USE_CURL_DLOPEN=0
    RTCW_BUILD_ARGS += USE_RENDERER_DLOPEN=0
    RTCW_BUILD_ARGS += USE_OPENGLES=1
    RTCW_BUILD_ARGS += USE_BLOOM=0
    RTCW_BUILD_ARGS += USE_MUMBLE=0
    RTCW_BUILD_ARGS += BUILD_RENDERER_REND2=0
endif

define RTCW_BUILD_CMDS
	# Single player
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(RTCW_BUILD_ARGS) -C $(@D)/SP
	# Multi player
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(RTCW_BUILD_ARGS) -C $(@D)/MP
endef

RTCW_CONF_INIT = $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/rtcw/main

define RTCW_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/rtcw
	mkdir -p $(TARGET_DIR)/usr/bin/rtcw/main
	# Single player
	$(INSTALL) -D $(@D)/SP/build/release-linux-$(RTCW_ARCH)/iowolfsp.$(RTCW_ARCH)	$(TARGET_DIR)/usr/bin/rtcw/iowolfsp
	$(INSTALL) -D $(@D)/SP/build/release-linux-$(RTCW_ARCH)/main/*.so 				$(TARGET_DIR)/usr/bin/rtcw/main/
	# Multi player
	$(INSTALL) -D $(@D)/MP/build/release-linux-$(RTCW_ARCH)/iowolfmp.$(RTCW_ARCH)	$(TARGET_DIR)/usr/bin/rtcw/iowolfmp
	$(INSTALL) -D $(@D)/MP/build/release-linux-$(RTCW_ARCH)/main/*.so				$(TARGET_DIR)/usr/bin/rtcw/main/
	# Additions if x86_64
	$(if $(BR2_x86_64),\
		$(INSTALL) -D $(@D)/SP/build/release-linux-$(RTCW_ARCH)/renderer_sp*.so		$(TARGET_DIR)/usr/bin/rtcw/; \
		$(INSTALL) -D $(@D)/MP/build/release-linux-$(RTCW_ARCH)/renderer_mp*.so		$(TARGET_DIR)/usr/bin/rtcw/;)
endef

# required to have fullscreen at 1st start
define RTCW_CONFIG_FILE
	mkdir -p $(RTCW_CONF_INIT)
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/rtcw/wolfconfig.cfg		$(RTCW_CONF_INIT)
endef

define RTCW_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/rtcw/rtcw.keys			$(TARGET_DIR)/usr/share/evmapy
endef

RTCW_POST_INSTALL_TARGET_HOOKS += RTCW_CONFIG_FILE
RTCW_POST_INSTALL_TARGET_HOOKS += RTCW_EVMAPY

$(eval $(generic-package))
$(eval $(emulator-info-package))
