################################################################################
#
# scummvm
#
################################################################################
# Version: Commits on Apr 13, 2024
SCUMMVM_VERSION = e2b1299d85564c29a1642185aeb6b96e56ded206
SCUMMVM_BRANCH = branch-2-8
SCUMMVM_SITE = $(call github,scummvm,scummvm,$(SCUMMVM_VERSION))
SCUMMVM_LICENSE = GPLv2
SCUMMVM_DEPENDENCIES += sdl2 zlib libmpeg2 libogg libvorbis flac libmad libpng libtheora faad2 freetype jpeg fluidsynth

SCUMMVM_ADDITIONAL_FLAGS= -I$(STAGING_DIR)/usr/include -lpthread -lm -L$(STAGING_DIR)/usr/lib -lGLESv2 -lEGL

ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
	SCUMMVM_ADDITIONAL_FLAGS += -I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
								-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux -lbcm_host -lvchostif
	SCUMMVM_CONF_OPTS += --host=raspberrypi
endif

SCUMMVM_CONF_ENV += RANLIB="$(TARGET_RANLIB)" STRIP="$(TARGET_STRIP)" AR="$(TARGET_AR) cru" AS="$(TARGET_AS)"

SCUMMVM_CONF_OPTS += --disable-static --enable-c++11 --enable-opengl --disable-debug --enable-optimizations \
			--enable-mt32emu --enable-flac --enable-mad --enable-vorbis --disable-tremor --enable-all-engines \
			--enable-fluidsynth --disable-taskbar --disable-timidity --disable-alsa --enable-vkeybd --enable-release \
			--enable-keymapper --disable-eventrecorder --prefix=/usr --with-sdl-prefix="$(STAGING_DIR)/usr/bin"

SCUMMVM_MAKE_OPTS += RANLIB="$(TARGET_RANLIB)" STRIP="$(TARGET_STRIP)" AR="$(TARGET_AR) cru" AS="$(TARGET_AS)" LD="$(TARGET_CXX)"

ifeq ($(BR2_ARCH_IS_64),y)
	SCUMMVM_CONF_OPTS += --disable-ext-neon
endif

ifeq ($(BR2_riscv),y)
    SCUMMVM_CONF_OPTS += --host=riscv64-linux
endif

ifeq ($(BR2_PACKAGE_LIBMPEG2),y)
    SCUMMVM_CONF_OPTS += --enable-mpeg2 --with-mpeg2-prefix="$(STAGING_DIR)/usr/lib"
endif

define SCUMMVM_ADD_VIRTUAL_KEYBOARD
	cp -f $(@D)/backends/vkeybd/packs/vkeybd_default.zip $(TARGET_DIR)/usr/share/scummvm
	cp -f $(@D)/backends/vkeybd/packs/vkeybd_small.zip $(TARGET_DIR)/usr/share/scummvm
	mkdir -p $(TARGET_DIR)/usr/share/evmapy/
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/scummvm/scummvm.keys $(TARGET_DIR)/usr/share/evmapy/
endef

SCUMMVM_POST_INSTALL_TARGET_HOOKS += SCUMMVM_ADD_VIRTUAL_KEYBOARD

$(eval $(autotools-package))
