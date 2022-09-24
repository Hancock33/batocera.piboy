################################################################################
#
# rtcw
#
################################################################################
# Version: Commits on Sept 23, 2022
RTCW_VERSION = 6cbc480b1a4ce1ebbbb52b85bc6ae080dafd2fc4
RTCW_SITE = $(call github,iortcw,iortcw,$(RTCW_VERSION))

RTCW_DEPENDENCIES = sdl2 sdl2_mixer openal
RTCW_LICENSE = GPL-2.0

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    RTCW_COMPILE_ARCH += arm64
    RTCW_COMPILE_ARCH += USE_OPENGLES=1
else
    RTCW_COMPILE_ARCH=x86_64
endif

define RTCW_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/SP -f Makefile \
	DEFAULT_BASEDIR=/userdata/roms/ports/rtcw \
	COMPILE_ARCH=$(RTCW_COMPILE_ARCH) \
	USE_CODEC_VORBIS=0 USE_CODEC_OPUS=0 USE_CURL=0 USE_CURL_DLOPEN=0 USE_OPENAL=1 USE_OPENAL_DLOPEN=1 USE_RENDERER_DLOPEN=0 USE_VOIP=0 \
	USE_LOCAL_HEADERS=1 USE_INTERNAL_JPEG=1 USE_INTERNAL_OPUS=1 USE_INTERNAL_ZLIB=1 USE_BLOOM=0 USE_MUMBLE=0 BUILD_GAME_SO=1 \
	BUILD_RENDERER_REND2=0
endef

define RTCW_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/game_assets/rtcw/main
    cp -pvr $(@D)/SP/build/release-linux-*/iowolfsp.* $(TARGET_DIR)/usr/bin/iowolfsp
    cp -pvr $(@D)/SP/build/release-linux-*/main/*.so  $(TARGET_DIR)/usr/share/game_assets/rtcw/main
    cp -pvr $(@D)/SP/build/release-linux-*/main/vm    $(TARGET_DIR)/usr/share/game_assets/rtcw/main
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/rtcw/rtcw.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
