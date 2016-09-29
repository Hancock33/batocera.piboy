################################################################################
#
# sdl2
#
################################################################################

# mali patched version
#ifeq ($(BR2_PACKAGE_MALI_OPENGLES_SDK),y)
#SDL2_VERSION = 3b3a4491d9fe5d97e106390c68ddc4f4dbb541b8
#SDL2_SITE = $(call github,mihailescu2m,libsdl2-2.0.2-dfsg1,$(SDL2_VERSION))
#else
SDL2_VERSION = 2.0.4
SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
SDL2_SITE = http://www.libsdl.org/release
#endif

SDL2_LICENSE = zlib
SDL2_LICENSE_FILES = COPYING.txt
SDL2_INSTALL_STAGING = YES
SDL2_DEPENDENCIES = udev

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
SDL2_DEPENDENCIES += $(LIBGLES_DEPENDENCIES)
SDL2_CONF_OPTS += --enable-video-opengles
else
SDL2_CONF_OPTS += --disable-video-opengles
endif

# add x11 dependencies to compile sdl2 only once there are already done (otherwise, dosbox doesn't work in fullscreen in X11)
ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
SDL2_DEPENDENCIES += xlib_libXi
endif
ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
SDL2_DEPENDENCIES += xlib_libXcursor
endif
ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
SDL2_DEPENDENCIES += xlib_libXinerama
endif
ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
SDL2_DEPENDENCIES += xlib_libXrandr
endif

ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
SDL2_DEPENDENCIES += $(LIBEGL_DEPENDENCIES)
ifeq ($(BR2_PACKAGE_PROVIDES_LIBEGL),"rpi-userland")
SDL2_CONF_OPTS += --host=$(subst -$(TARGET_VENDOR)-$(TARGET_OS)-,-raspberry-linux-,$(GNU_TARGET_NAME))
endif
endif

SDL2_CONF_OPTS += --enable-video-fbdev

# Note: SDL2 looks for X11 headers in host dirs, so if you want to build SDL2
#       with X11 support, better make it safe for cross compilation first.
# hum, ok, but i want it for x86 please
ifeq ($(BR2_x86_i586),y)
SDL2_CONF_OPTS += --enable-video-x11
else ifeq ($(BR2_x86_64),y)
SDL2_CONF_OPTS += --enable-video-x11
else
SDL2_CONF_OPTS += --disable-video-x11
endif

ifeq ($(BR2_PACKAGE_DIRECTFB),y)
SDL2_DEPENDENCIES += directfb
SDL2_CONF_OPTS += --enable-video-directfb
SDL2_CONF_ENV += ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
else
SDL2_CONF_OPTS += --disable-video-directfb
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
SDL2_DEPENDENCIES += alsa-lib
SDL2_CONF_OPTS += --enable-alsa --disable-oss
else
SDL2_CONF_OPTS += --disable-alsa
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
SDL2_DEPENDENCIES += pulseaudio
SDL2_CONF_OPTS += --enable-pulseaudio
else
SDL2_CONF_OPTS += --disable-pulseaudio
endif

SDL2_CONF_OPTS += --disable-esd

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
SDL2_CONF_OPTS += --enable-libudev
else
SDL2_CONF_OPTS += --disable-libudev
endif

ifeq ($(BR2_PACKAGE_DBUS),y)
SDL2_CONF_OPTS += --enable-dbus
else
SDL2_CONF_OPTS += --disable-dbus
endif

# OpenDingux hack: We've got tslib to make porting easier, but we've got no
#                  touch screen, so having SDL try to use tslib is pointless.
# ifeq ($(BR2_PACKAGE_TSLIB),y)
# SDL2_DEPENDENCIES += tslib
# SDL2_CONF_OPTS += --enable-input-tslib
# else
SDL2_CONF_OPTS += --disable-input-tslib
# endif

SDL2_CONF_OPTS += --disable-rpath

define SDL2_FIXUP_SDL2_CONFIG
	$(SED) 's%^prefix=.*%prefix=$(STAGING_DIR)/usr%' \
		$(STAGING_DIR)/usr/bin/sdl2-config
	$(SED) 's%^exec_prefix=.*%exec_prefix=$${prefix}%' \
		$(STAGING_DIR)/usr/bin/sdl2-config
endef

define SDL2_REMOVE_SDL2_CONFIG
	mv $(TARGET_DIR)/usr/bin/sdl2-config $(HOST_DIR)/usr/bin
endef

SDL2_POST_INSTALL_TARGET_HOOKS += SDL2_REMOVE_SDL2_CONFIG
SDL2_POST_INSTALL_STAGING_HOOKS += SDL2_FIXUP_SDL2_CONFIG

$(eval $(autotools-package))
