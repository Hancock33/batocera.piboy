################################################################################
#
# Return to Castle Wolfenstein
#
################################################################################
# Version.: Commits on Nov 19, 2021
RTCW_VERSION = e10e9a429a62e60a0d1cf35d1d2166a6cb7bcc1f
RTCW_SITE = $(call github,iortcw,iortcw,$(RTCW_VERSION))

RTCW_DEPENDENCIES = sdl2 sdl2_mixer openal
RTCW_LICENSE = GPL-2.0

ifeq ($(BR2_PACKAGE_XPI_GAMECON_RPI3)$(BR2_PACKAGE_XPI_GAMECON_RPI4),y)   
    RTCW_COMPILE_ARCH += arm64
    RTCW_COMPILE_ARCH += USE_OPENGLES=1
else
    RTCW_COMPILE_ARCH=x86_64
endif

define RTCW_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/SP -f Makefile \
	DEFAULT_BASEDIR=/userdata/roms/rtcw \
	COMPILE_ARCH=$(RTCW_COMPILE_ARCH) \
	USE_CODEC_VORBIS=0 USE_CODEC_OPUS=0 USE_CURL=0 USE_CURL_DLOPEN=0 USE_OPENAL=1 USE_OPENAL_DLOPEN=1 USE_RENDERER_DLOPEN=0 USE_VOIP=0 \
	USE_LOCAL_HEADERS=1 USE_INTERNAL_JPEG=1 USE_INTERNAL_OPUS=1 USE_INTERNAL_ZLIB=1 USE_BLOOM=0 USE_MUMBLE=0 BUILD_GAME_SO=1 \
	BUILD_RENDERER_REND2=0
endef

define RTCW_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/rtcw/main
    cp -pvr $(@D)/SP/build/release-linux-*/iowolfsp.* $(TARGET_DIR)/usr/bin/iowolfsp
    cp -pvr $(@D)/SP/build/release-linux-*/main/*.so $(TARGET_DIR)/usr/share/batocera/datainit/roms/rtcw/main
    cp -pvr $(@D)/SP/build/release-linux-*/main/vm $(TARGET_DIR)/usr/share/batocera/datainit/roms/rtcw/main
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/rtcw/rtcw.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
