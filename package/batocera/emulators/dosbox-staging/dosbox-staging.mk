################################################################################
#
# dosbox-staging
#
################################################################################
# Version: Commits on Jan 13, 2023
DOSBOX_STAGING_VERSION = 362dbfe1c0e280bc5e63a9225509c8c8053a8083
DOSBOX_STAGING_SITE = $(call github,dosbox-staging,dosbox-staging,$(DOSBOX_STAGING_VERSION))
DOSBOX_STAGING_DEPENDENCIES = sdl2 sdl2_net fluidsynth zlib libpng libogg libvorbis opus opusfile slirp speexdsp iir
DOSBOX_STAGING_LICENSE = GPLv2

DOSBOX_STAGING_CPPFLAGS = -DNDEBUG
DOSBOX_STAGING_CFLAGS   = -O3 -fstrict-aliasing -fno-signed-zeros -fno-trapping-math -fassociative-math -frename-registers -ffunction-sections -fdata-sections
DOSBOX_STAGING_CXXFLAGS = -O3 -fstrict-aliasing -fno-signed-zeros -fno-trapping-math -fassociative-math -frename-registers -ffunction-sections -fdata-sections
DOSBOX_STAGING_CONF_OPTS = -Duse_mt32emu=false

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
DOSBOX_STAGING_CFLAGS   += -mcpu=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard
DOSBOX_STAGING_CXXFLAGS += -mcpu=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836)$(BR2_PACKAGE_BATOCERA_TARGET_ORANGEPI_PC)$(BR2_PACKAGE_BATOCERA_TARGET_CHA)$(BR2_PACKAGE_BATOCERA_TARGET_RK3128),y)
DOSBOX_STAGING_CFLAGS   += -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard
DOSBOX_STAGING_CXXFLAGS += -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
DOSBOX_STAGING_CFLAGS   += -march=armv8-a+crc -mcpu=cortex-a53 -mtune=cortex-a53
DOSBOX_STAGING_CXXFLAGS += -march=armv8-a+crc -mcpu=cortex-a53 -mtune=cortex-a53
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
DOSBOX_STAGING_CFLAGS   += -march=armv8-a+crc -mcpu=cortex-a72 -mtune=cortex-a72
DOSBOX_STAGING_CXXFLAGS += -march=armv8-a+crc -mcpu=cortex-a72 -mtune=cortex-a72
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_TRITIUM_H5)$(BR2_PACKAGE_BATOCERA_TARGET_S905)$(BR2_PACKAGE_BATOCERA_TARGET_S912),y)
DOSBOX_STAGING_CFLAGS   += -march=armv8-a+crc -mtune=cortex-a53
DOSBOX_STAGING_CXXFLAGS += -march=armv8-a+crc -mtune=cortex-a53
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S905GEN2)$(BR2_PACKAGE_BATOCERA_TARGET_ORANGEPI_ZERO2)$(BR2_PACKAGE_BATOCERA_TARGET_ORANGEPI_3_LTS),y)
DOSBOX_STAGING_CFLAGS   += -march=armv8-a+crc -mtune=cortex-a53
DOSBOX_STAGING_CXXFLAGS += -march=armv8-a+crc -mtune=cortex-a53
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S905GEN3),y)
DOSBOX_STAGING_CFLAGS   += -march=armv8-a+crc -mtune=cortex-a55
DOSBOX_STAGING_CXXFLAGS += -march=armv8-a+crc -mtune=cortex-a55
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
DOSBOX_STAGING_CFLAGS   += -march=armv8-a+crc -mcpu=cortex-a73 -mtune=cortex-a73.cortex-a53
DOSBOX_STAGING_CXXFLAGS += -march=armv8-a+crc -mcpu=cortex-a73 -mtune=cortex-a73.cortex-a53
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_XU4),y)
DOSBOX_STAGING_CFLAGS   += -mcpu=cortex-a15 -mfpu=neon-vfpv4 -mfloat-abi=hard
DOSBOX_STAGING_CXXFLAGS += -mcpu=cortex-a15 -mfpu=neon-vfpv4 -mfloat-abi=hard
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3288),y)
DOSBOX_STAGING_CFLAGS   += -marm -march=armv7-a -mtune=cortex-a17 -mfpu=neon-vfpv4 -mfloat-abi=hard
DOSBOX_STAGING_CXXFLAGS += -marm -march=armv7-a -mtune=cortex-a17 -mfpu=neon-vfpv4 -mfloat-abi=hard
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3326),y)
DOSBOX_STAGING_CFLAGS   += -march=armv8-a+crc -mtune=cortex-a55
DOSBOX_STAGING_CXXFLAGS += -march=armv8-a+crc -mtune=cortex-a55
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
DOSBOX_STAGING_CFLAGS   += -march=armv8.2-a+dotprod+rcpc+ssbs+sb -mtune=cortex-a76.cortex-a55
DOSBOX_STAGING_CXXFLAGS += -march=armv8.2-a+dotprod+rcpc+ssbs+sb -mtune=cortex-a76.cortex-a55
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
DOSBOX_STAGING_CFLAGS   += -marm -march=armv7-a -mtune=cortex-a9 -mfpu=neon-vfpv3 -mfloat-abi=hard
DOSBOX_STAGING_CXXFLAGS += -marm -march=armv7-a -mtune=cortex-a9 -mfpu=neon-vfpv3 -mfloat-abi=hard
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODIN),y)
DOSBOX_STAGING_CFLAGS   += -march=armv8-a+crc -mcpu=cortex-a75 -mtune=cortex-a75.cortex-a55
DOSBOX_STAGING_CXXFLAGS += -march=armv8-a+crc -mcpu=cortex-a75 -mtune=cortex-a75.cortex-a55
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif

ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
DOSBOX_STAGING_DEPENDENCIES += fluidsynth
DOSBOX_STAGING_CONF_OPTS += -Duse_fluidsynth=true
else
DOSBOX_STAGING_CONF_OPTS += -Duse_fluidsynth=false
endif

DOSBOX_STAGING_CONF_OPTS += -Duse_slirp=false
DOSBOX_STAGING_CONF_OPTS += -Dunit_tests=disabled

# this is a not nice workaround
# i don't know why meson uses bad ssl certificates and doesn't manage to download them
define DOSBOX_DL_DEPENDENCIES
	mkdir -p $(@D)/subprojects/packagecache
	curl -L https://github.com/berndporr/iir1/archive/refs/tags/1.9.3.tar.gz -o $(@D)/subprojects/packagecache/1.9.3.tar.gz
	curl -L https://wrapdb.mesonbuild.com/v2/iir_1.9.3-1/get_patch           -o $(@D)/subprojects/packagecache/iir_1.9.3-1_patch.zip
	curl -L https://downloads.xiph.org/releases/speex/speexdsp-1.2.1.tar.gz  -o $(@D)/subprojects/packagecache/speexdsp-1.2.1.tar.gz
	curl -L https://wrapdb.mesonbuild.com/v2/speexdsp_1.2.1-7/get_patch      -o $(@D)/subprojects/packagecache/speexdsp_1.2.1-7_patch.zip
endef
DOSBOX_STAGING_PRE_CONFIGURE_HOOKS += DOSBOX_DL_DEPENDENCIES

define DOSBOX_STAGING_INSTALL_TARGET_CMDS
        $(INSTALL) -D $(@D)/build/dosbox $(TARGET_DIR)/usr/bin/dosbox-staging
		mkdir -p $(TARGET_DIR)/usr/share/evmapy
		cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/dosbox-staging/dos.dosbox_staging.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(meson-package))