################################################################################
#
# scummvm
#
################################################################################
# Version: Commits on Dec 26, 2025
SCUMMVM_VERSION = d4287f049c31f0825569f8e6b360f6d0345a036f
SCUMMVM_SITE = $(call github,scummvm,scummvm,$(SCUMMVM_VERSION))
SCUMMVM_BRANCH = branch-3-0
SCUMMVM_LICENSE = GPLv2
SCUMMVM_DEPENDENCIES += faad2 flac fluidsynth freetype jpeg libmad libmpeg2
SCUMMVM_DEPENDENCIES += libogg libpng libtheora libvorbis sdl2 zlib

SCUMMVM_ADDITIONAL_FLAGS += -I$(STAGING_DIR)/usr/include -lpthread -lm
SCUMMVM_ADDITIONAL_FLAGS += -L$(STAGING_DIR)/usr/lib -lGLESv2 -lEGL

# Select host architecture
ifeq ($(BR2_aarch64)$(BR2_arm),y)
    SCUMMVM_CONF_OPTS += --host=arm-linux
else ifeq ($(BR2_riscv),y)
    SCUMMVM_CONF_OPTS += --host=riscv64-linux
else ifeq ($(BR2_mipsel),y)
    SCUMMVM_CONF_OPTS += --host=mipsel-linux
endif

SCUMMVM_CONF_ENV += RANLIB="$(TARGET_RANLIB)" STRIP="$(TARGET_STRIP)"
SCUMMVM_CONF_ENV += AR="$(TARGET_AR) cru" AS="$(TARGET_AS)"

SCUMMVM_CONF_OPTS += --disable-static --enable-c++11 --enable-opengl --disable-debug --enable-optimizations \
			--enable-mt32emu --enable-flac --enable-mad --enable-vorbis --disable-tremor --enable-all-engines \
			--enable-fluidsynth --disable-taskbar --disable-timidity --disable-alsa --enable-vkeybd --enable-release \
			--enable-keymapper --disable-eventrecorder --prefix=/usr --with-sdl-prefix="$(STAGING_DIR)/usr/bin"

# Common options
SCUMMVM_CONF_OPTS += --disable-alsa --disable-debug --disable-eventrecorder --disable-taskbar --disable-timidity
SCUMMVM_CONF_OPTS += --enable-all-engines --enable-flac --enable-mad --enable-optimizations --enable-release --enable-vkeybd
SCUMMVM_CONF_OPTS += --opengl-mode=auto --prefix=/usr --with-sdl-prefix="$(STAGING_DIR)/usr/bin"

# Vorbis/Tremor options
ifeq ($(BR2_mipsel)$(BR2_arm),y)
    SCUMMVM_CONF_OPTS += --enable-tremor --disable-vorbis
    SCUMMVM_DEPENDENCIES += tremor
else
    SCUMMVM_CONF_OPTS += --enable-vorbis --disable-tremor
    SCUMMVM_DEPENDENCIES += libvorbis
endif

# Munt (MT32-Emulator) options
ifeq ($(BR2_PACKAGE_MT32EMU),y)
    SCUMMVM_DEPENDENCIES += mt32emu
    SCUMMVM_CONF_OPTS += --enable-mt32emu
else
    SCUMMVM_CONF_OPTS += --disable-mt32emu
endif

# FluidSynth (MIDI rendering) options
ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
    SCUMMVM_DEPENDENCIES += fluidsynth
    SCUMMVM_CONF_OPTS += --enable-fluidsynth
else
    SCUMMVM_CONF_OPTS += --disable-fluidsynth
endif

# libopenmpt
ifeq ($(BR2_PACKAGE_LIBOPENMPT),y)
    SCUMMVM_DEPENDENCIES += libopenmpt
    SCUMMVM_CONF_OPTS += --enable-openmpt
endif

# libmpeg2
ifeq ($(BR2_PACKAGE_LIBMPEG2),y)
    SCUMMVM_CONF_OPTS += --enable-mpeg2 --with-mpeg2-prefix="$(STAGING_DIR)/usr/lib"
endif

SCUMMVM_MAKE_OPTS += RANLIB="$(TARGET_RANLIB)" STRIP="$(TARGET_STRIP)"
SCUMMVM_MAKE_OPTS += AR="$(TARGET_AR) cru" AS="$(TARGET_AS)" LD="$(TARGET_CXX)"

define SCUMMVM_CONFIGURE_CMDS
	(cd $(@D) && rm -rf config.cache && \
	$(TARGET_CONFIGURE_OPTS) \
	$(TARGET_CONFIGURE_ARGS) \
	$(SCUMMVM_CONF_ENV) \
	./configure \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--program-prefix="" \
		$(SCUMMVM_CONF_OPTS) \
	)
endef

define SCUMMVM_ADD_VIRTUAL_KEYBOARD
	cp -f $(@D)/backends/vkeybd/packs/vkeybd_default.zip $(TARGET_DIR)/usr/share/scummvm
	cp -f $(@D)/backends/vkeybd/packs/vkeybd_small.zip $(TARGET_DIR)/usr/share/scummvm
endef

SCUMMVM_POST_INSTALL_TARGET_HOOKS += SCUMMVM_ADD_VIRTUAL_KEYBOARD

$(eval $(autotools-package))
