################################################################################
#
# wine-proton
#
################################################################################
# Version: Commits on Aug 20, 2025
WINE_PROTON_VERSION = cachyos-10.0-20250820-proton-native
WINE_PROTON_SOURCE = wine-$(WINE_PROTON_VERSION).tar.gz
WINE_PROTON_SITE = $(call github,CachyOS,wine-cachyos,$(WINE_PROTON_VERSION))
WINE_PROTON_LICENSE = LGPL-2.1+
WINE_PROTON_LICENSE_FILES = COPYING.LIB LICENSE
WINE_PROTON_SELINUX_MODULES = wine
WINE_PROTON_DEPENDENCIES = host-bison host-flex host-wine-proton
HOST_WINE_PROTON_DEPENDENCIES = host-bison host-flex

ifeq ($(BR_CMAKE_USE_CLANG),y)
    HOST_WINE_PROTON_DEPENDENCIES += host-clang host-lld
endif

define WINE_PROTON_AUTOGEN
	# Create folder for install
	mkdir -p $(TARGET_DIR)/usr/wine/wine-proton
	# Autotools generation
	cd $(@D); ./tools/make_requests
	cd $(@D); ./tools/make_specfiles
	cd $(@D); ./dlls/winevulkan/make_vulkan && rm -rf dlls/winevulkan/vk-*.xml
	cd $(@D); autoreconf -fiv
endef

WINE_PROTON_PRE_CONFIGURE_HOOKS += WINE_PROTON_AUTOGEN
HOST_WINE_PROTON_PRE_CONFIGURE_HOOKS += WINE_PROTON_AUTOGEN

# Wine needs its own directory structure and tools for cross compiling
WINE_PROTON_CONF_OPTS = LDFLAGS="-Wl,--no-as-needed -lm" CPPFLAGS="-DMPG123_NO_LARGENAME=1" \
	--with-wine-tools=$(BUILD_DIR)/host-wine-proton-$(WINE_PROTON_VERSION) \
	--disable-tests \
	--without-capi \
	--without-coreaudio \
	--without-gettext \
	--without-gettextpo \
	--without-gphoto \
	--without-ldap \
	--without-mingw \
	--without-opencl \
	--without-oss \
	--prefix=/usr/wine/wine-proton \
	--exec-prefix=/usr/wine/wine-proton

ifeq ($(BR2_x86_64),y)
    WINE_PROTON_CONF_OPTS += --enable-tools
    WINE_PROTON_CONF_OPTS += --enable-archs=x86_64,i386
else
    WINE_PROTON_CONF_OPTS += --disable-win64
endif

# Wine uses a wrapper around gcc, and uses the value of --host to
# construct the filename of the gcc to call.  But for external
# toolchains, the GNU_TARGET_NAME tuple that we construct from our
# internal variables may differ from the actual gcc prefix for the
# external toolchains. So, we have to override whatever the gcc
# wrapper believes what the real gcc is named, and force the tuple of
# the external toolchain, not the one we compute in GNU_TARGET_NAME.
ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
WINE_PROTON_CONF_OPTS += TARGETFLAGS="-b $(TOOLCHAIN_EXTERNAL_PREFIX)"
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
WINE_PROTON_CONF_OPTS += --with-alsa
WINE_PROTON_DEPENDENCIES += alsa-lib
else
WINE_PROTON_CONF_OPTS += --without-alsa
endif

ifeq ($(BR2_PACKAGE_CUPS),y)
WINE_PROTON_CONF_OPTS += --with-cups
WINE_PROTON_DEPENDENCIES += cups
WINE_PROTON_CONF_ENV += CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
else
WINE_PROTON_CONF_OPTS += --without-cups
endif

ifeq ($(BR2_PACKAGE_DBUS),y)
WINE_PROTON_CONF_OPTS += --with-dbus
WINE_PROTON_DEPENDENCIES += dbus
else
WINE_PROTON_CONF_OPTS += --without-dbus
endif

ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
WINE_PROTON_CONF_OPTS += --with-fontconfig
WINE_PROTON_DEPENDENCIES += fontconfig
else
WINE_PROTON_CONF_OPTS += --without-fontconfig
endif

# To support freetype in wine we also need freetype in host-wine for the cross compiling tools
ifeq ($(BR2_PACKAGE_FREETYPE),y)
WINE_PROTON_CONF_OPTS += --with-freetype
HOST_WINE_PROTON_CONF_OPTS += --with-freetype
WINE_PROTON_DEPENDENCIES += freetype
HOST_WINE_PROTON_DEPENDENCIES += host-freetype
WINE_PROTON_CONF_ENV += FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
else
WINE_PROTON_CONF_OPTS += --without-freetype
HOST_WINE_PROTON_CONF_OPTS += --without-freetype
endif

ifeq ($(BR2_PACKAGE_GNUTLS),y)
WINE_PROTON_CONF_OPTS += --with-gnutls
WINE_PROTON_DEPENDENCIES += gnutls
else
WINE_PROTON_CONF_OPTS += --without-gnutls
endif

ifeq ($(BR2_PACKAGE_FFMPEG),y)
WINE_PROTON_CONF_OPTS += --without-gstreamer --with-ffmpeg
WINE_PROTON_DEPENDENCIES += ffmpeg
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
WINE_PROTON_CONF_OPTS += --with-opengl
WINE_PROTON_DEPENDENCIES += libgl
else
WINE_PROTON_CONF_OPTS += --without-opengl
endif

ifeq ($(BR2_PACKAGE_LIBKRB5),y)
WINE_PROTON_CONF_OPTS += --with-krb5
WINE_PROTON_DEPENDENCIES += libkrb5
else
WINE_PROTON_CONF_OPTS += --without-krb5
endif

ifeq ($(BR2_PACKAGE_LIBPCAP),y)
WINE_PROTON_CONF_OPTS += --with-pcap
WINE_PROTON_DEPENDENCIES += libpcap
else
WINE_PROTON_CONF_OPTS += --without-pcap
endif

ifeq ($(BR2_PACKAGE_LIBUSB),y)
WINE_PROTON_CONF_OPTS += --with-usb
WINE_PROTON_DEPENDENCIES += libusb
else
WINE_PROTON_CONF_OPTS += --without-usb
endif

ifeq ($(BR2_PACKAGE_LIBV4L),y)
WINE_PROTON_CONF_OPTS += --with-v4l2
WINE_PROTON_DEPENDENCIES += libv4l
else
WINE_PROTON_CONF_OPTS += --without-v4l2
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
WINE_PROTON_CONF_OPTS += --with-pulse
WINE_PROTON_DEPENDENCIES += pulseaudio
else
WINE_PROTON_CONF_OPTS += --without-pulse
endif

ifeq ($(BR2_PACKAGE_SAMBA4),y)
WINE_PROTON_CONF_OPTS += --with-netapi
WINE_PROTON_DEPENDENCIES += samba4
else
WINE_PROTON_CONF_OPTS += --without-netapi
endif

ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
WINE_PROTON_CONF_OPTS += --with-sane
WINE_PROTON_DEPENDENCIES += sane-backends
WINE_PROTON_CONF_ENV += SANE_CONFIG=$(STAGING_DIR)/usr/bin/sane-config
else
WINE_PROTON_CONF_OPTS += --without-sane
endif

ifeq ($(BR2_PACKAGE_SDL2),y)
WINE_PROTON_CONF_OPTS += --with-sdl
WINE_PROTON_DEPENDENCIES += sdl2
else
WINE_PROTON_CONF_OPTS += --without-sdl
endif

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
WINE_PROTON_CONF_OPTS += --with-udev
WINE_PROTON_DEPENDENCIES += udev
else
WINE_PROTON_CONF_OPTS += --without-udev
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    WINE_PROTON_CONF_OPTS += --with-vulkan
    WINE_PROTON_DEPENDENCIES += vulkan-headers vulkan-loader
else
    WINE_PROTON_CONF_OPTS += --without-vulkan
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
WINE_PROTON_CONF_OPTS += --with-x
WINE_PROTON_DEPENDENCIES += xlib_libX11
else
WINE_PROTON_CONF_OPTS += --without-x
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
WINE_PROTON_CONF_OPTS += --with-xcomposite
WINE_PROTON_DEPENDENCIES += xlib_libXcomposite
else
WINE_PROTON_CONF_OPTS += --without-xcomposite
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
WINE_PROTON_CONF_OPTS += --with-xcursor
WINE_PROTON_DEPENDENCIES += xlib_libXcursor
else
WINE_PROTON_CONF_OPTS += --without-xcursor
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
WINE_PROTON_CONF_OPTS += --with-xshape --with-xshm
WINE_PROTON_DEPENDENCIES += xlib_libXext
else
WINE_PROTON_CONF_OPTS += --without-xshape --without-xshm
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
WINE_PROTON_CONF_OPTS += --with-xinput --with-xinput2
WINE_PROTON_DEPENDENCIES += xlib_libXi
else
WINE_PROTON_CONF_OPTS += --without-xinput --without-xinput2
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
WINE_PROTON_CONF_OPTS += --with-xinerama
WINE_PROTON_DEPENDENCIES += xlib_libXinerama
else
WINE_PROTON_CONF_OPTS += --without-xinerama
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
WINE_PROTON_CONF_OPTS += --with-xrandr
WINE_PROTON_DEPENDENCIES += xlib_libXrandr
else
WINE_PROTON_CONF_OPTS += --without-xrandr
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
WINE_PROTON_CONF_OPTS += --with-xrender
WINE_PROTON_DEPENDENCIES += xlib_libXrender
else
WINE_PROTON_CONF_OPTS += --without-xrender
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
WINE_PROTON_CONF_OPTS += --with-xxf86vm
WINE_PROTON_DEPENDENCIES += xlib_libXxf86vm
else
WINE_PROTON_CONF_OPTS += --without-xxf86vm
endif

# host-gettext is essential for .po file support in host-wine wrc
ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
HOST_WINE_PROTON_DEPENDENCIES += host-gettext
HOST_WINE_PROTON_CONF_OPTS += --with-gettext --with-gettextpo
else
HOST_WINE_PROTON_CONF_OPTS += --without-gettext --without-gettextpo
endif

# Wine needs to enable 64-bit build tools on 64-bit host
ifeq ($(HOSTARCH),x86_64)
HOST_WINE_PROTON_CONF_OPTS += --enable-win64
endif

# Wine only needs the host tools to be built, so cut-down the
# build time by building just what we need.
define HOST_WINE_PROTON_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) __tooldeps__
endef

# Wine only needs its host variant to be built, not that it is
# installed, as it uses the tools from the build directory. But
# we have no way in Buildroot to state that a host package should
# not be installed. So, just provide an noop install command.
define HOST_WINE_PROTON_INSTALL_CMDS
	:
endef

# We are focused on the cross compiling tools, disable everything else
HOST_WINE_PROTON_CONF_OPTS += \
	--disable-tests \
	--disable-win16 \
	--disable-winemenubuilder \
	--without-alsa \
	--without-capi \
	--without-coreaudio \
	--without-cups \
	--without-dbus \
	--without-fontconfig \
	--without-gnutls \
	--without-gphoto \
	--without-gssapi \
	--without-gstreamer \
	--without-krb5 \
	--without-ldap \
	--without-mingw \
	--without-netapi \
	--without-opencl \
	--without-opengl \
	--without-osmesa \
	--without-oss \
	--without-pcap \
	--without-pulse \
	--without-sane \
	--without-sdl \
	--without-usb \
	--without-v4l2 \
	--without-vulkan \
	--without-x \
	--without-xcomposite \
	--without-xcursor \
	--without-xinerama \
	--without-xinput \
	--without-xinput2 \
	--without-xrandr \
	--without-xrender \
	--without-xshape \
	--without-xshm \
	--without-xxf86vm

# Cleanup final directory
define WINE_PROTON_REMOVE_INCLUDES_HOOK
	rm -Rf $(TARGET_DIR)/usr/wine/wine-proton/include
	i686-w64-mingw32-strip --strip-unneeded $(TARGET_DIR)/usr/wine/wine-proton/lib/wine/i386-windows/*.{dll,exe}
	x86_64-w64-mingw32-strip --strip-unneeded $(TARGET_DIR)/usr/wine/wine-proton/lib/wine/x86_64-windows/*.{dll,exe}
endef

WINE_PROTON_POST_INSTALL_TARGET_HOOKS += WINE_PROTON_REMOVE_INCLUDES_HOOK

$(eval $(autotools-package))
$(eval $(host-autotools-package))
