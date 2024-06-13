################################################################################
#
# wine-custom
#
################################################################################
# Version: Commits on Jun 11, 2024
WINE_CUSTOM_VERSION = e6f9cb1e0935a0381ea54663dc61886677d1bb5a
WINE_CUSTOM_SOURCE = wine-$(WINE_CUSTOM_VERSION).tar.gz
WINE_CUSTOM_SITE = $(call github,wine-mirror,wine,$(WINE_CUSTOM_VERSION))
WINE_CUSTOM_LICENSE = LGPL-2.1+
WINE_CUSTOM_LICENSE_FILES = COPYING.LIB LICENSE
WINE_CUSTOM_SELINUX_MODULES = wine
WINE_CUSTOM_DEPENDENCIES = host-bison host-flex host-wine-custom
HOST_WINE_CUSTOM_DEPENDENCIES = host-bison host-flex

ifeq ($(BR_CMAKE_USE_CLANG),y)
	HOST_WINE_CUSTOM_DEPENDENCIES += host-clang host-lld
endif

ifeq ($(BR_WINE_STAGING),y)
	WINE_CUSTOM_STAGING_VERSION = 5c6c431443ee6cf850c78225f499f23aa356ea47
	HOST_WINE_CUSTOM_EXTRA_DOWNLOADS = https://github.com/wine-staging/wine-staging/archive/$(WINE_CUSTOM_STAGING_VERSION).tar.gz
	WINE_CUSTOM_POST_EXTRACT_HOOKS += WINE_CUSTOM_STAGING
	HOST_WINE_CUSTOM_POST_EXTRACT_HOOKS += WINE_CUSTOM_STAGING
endif

define WINE_CUSTOM_STAGING
	# Use Staging Patches
	printf "%s\n" "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) Patching wine-staging" >&2
	tar -xf $(WINE_CUSTOM_DL_DIR)/$(WINE_CUSTOM_STAGING_VERSION).tar.gz -C $(@D)
	cd $(@D); ./wine-staging-$(subst v,,$(WINE_CUSTOM_STAGING_VERSION))/staging/patchinstall.py --all
endef

define WINE_CUSTOM_AUTOGEN
	# Create folder for install
	mkdir -p $(TARGET_DIR)/usr/wine/ge-custom
	# Autotools generation
	cd $(@D); ./tools/make_requests
	cd $(@D); ./tools/make_specfiles
	cd $(@D); ./dlls/winevulkan/make_vulkan && rm dlls/winevulkan/vk-*.xml
	cd $(@D); autoreconf -fiv
endef

WINE_CUSTOM_PRE_CONFIGURE_HOOKS += WINE_CUSTOM_AUTOGEN
HOST_WINE_CUSTOM_PRE_CONFIGURE_HOOKS += WINE_CUSTOM_AUTOGEN

# Wine needs its own directory structure and tools for cross compiling
WINE_CUSTOM_CONF_OPTS = LDFLAGS="-Wl,--no-as-needed -lm" CPPFLAGS="-DMPG123_NO_LARGENAME=1" \
	--with-wine-tools=$(BUILD_DIR)/host-wine-custom-$(WINE_CUSTOM_VERSION) \
	--disable-tests \
	--without-capi \
	--without-coreaudio \
	--without-gettext \
	--without-gettextpo \
	--without-gphoto \
	--without-mingw \
	--without-opencl \
	--without-oss \
	--prefix=/usr/wine/ge-custom \
	--exec-prefix=/usr/wine/ge-custom

ifeq ($(BR2_x86_64),y)
	WINE_CUSTOM_CONF_OPTS += --enable-win64
else
	WINE_CUSTOM_CONF_OPTS += --disable-win64
endif

# Wine uses a wrapper around gcc, and uses the value of --host to
# construct the filename of the gcc to call.  But for external
# toolchains, the GNU_TARGET_NAME tuple that we construct from our
# internal variables may differ from the actual gcc prefix for the
# external toolchains. So, we have to override whatever the gcc
# wrapper believes what the real gcc is named, and force the tuple of
# the external toolchain, not the one we compute in GNU_TARGET_NAME.
ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
WINE_CUSTOM_CONF_OPTS += TARGETFLAGS="-b $(TOOLCHAIN_EXTERNAL_PREFIX)"
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
WINE_CUSTOM_CONF_OPTS += --with-alsa
WINE_CUSTOM_DEPENDENCIES += alsa-lib
else
WINE_CUSTOM_CONF_OPTS += --without-alsa
endif

ifeq ($(BR2_PACKAGE_CUPS),y)
WINE_CUSTOM_CONF_OPTS += --with-cups
WINE_CUSTOM_DEPENDENCIES += cups
WINE_CUSTOM_CONF_ENV += CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
else
WINE_CUSTOM_CONF_OPTS += --without-cups
endif

ifeq ($(BR2_PACKAGE_DBUS),y)
WINE_CUSTOM_CONF_OPTS += --with-dbus
WINE_CUSTOM_DEPENDENCIES += dbus
else
WINE_CUSTOM_CONF_OPTS += --without-dbus
endif

ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
WINE_CUSTOM_CONF_OPTS += --with-fontconfig
WINE_CUSTOM_DEPENDENCIES += fontconfig
else
WINE_CUSTOM_CONF_OPTS += --without-fontconfig
endif

# To support freetype in wine we also need freetype in host-wine for the cross compiling tools
ifeq ($(BR2_PACKAGE_FREETYPE),y)
WINE_CUSTOM_CONF_OPTS += --with-freetype
HOST_WINE_CUSTOM_CONF_OPTS += --with-freetype
WINE_CUSTOM_DEPENDENCIES += freetype
HOST_WINE_CUSTOM_DEPENDENCIES += host-freetype
WINE_CUSTOM_CONF_ENV += FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
else
WINE_CUSTOM_CONF_OPTS += --without-freetype
HOST_WINE_CUSTOM_CONF_OPTS += --without-freetype
endif

ifeq ($(BR2_PACKAGE_GNUTLS),y)
WINE_CUSTOM_CONF_OPTS += --with-gnutls
WINE_CUSTOM_DEPENDENCIES += gnutls
else
WINE_CUSTOM_CONF_OPTS += --without-gnutls
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
WINE_CUSTOM_CONF_OPTS += --with-gstreamer
WINE_CUSTOM_DEPENDENCIES += gst1-plugins-base
else
WINE_CUSTOM_CONF_OPTS += --without-gstreamer
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
WINE_CUSTOM_CONF_OPTS += --with-opengl
WINE_CUSTOM_DEPENDENCIES += libgl
else
WINE_CUSTOM_CONF_OPTS += --without-opengl
endif

ifeq ($(BR2_PACKAGE_LIBKRB5),y)
WINE_CUSTOM_CONF_OPTS += --with-krb5
WINE_CUSTOM_DEPENDENCIES += libkrb5
else
WINE_CUSTOM_CONF_OPTS += --without-krb5
endif

ifeq ($(BR2_PACKAGE_LIBPCAP),y)
WINE_CUSTOM_CONF_OPTS += --with-pcap
WINE_CUSTOM_DEPENDENCIES += libpcap
else
WINE_CUSTOM_CONF_OPTS += --without-pcap
endif

ifeq ($(BR2_PACKAGE_LIBUSB),y)
WINE_CUSTOM_CONF_OPTS += --with-usb
WINE_CUSTOM_DEPENDENCIES += libusb
else
WINE_CUSTOM_CONF_OPTS += --without-usb
endif

ifeq ($(BR2_PACKAGE_LIBV4L),y)
WINE_CUSTOM_CONF_OPTS += --with-v4l2
WINE_CUSTOM_DEPENDENCIES += libv4l
else
WINE_CUSTOM_CONF_OPTS += --without-v4l2
endif

ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_GALLIUM),y)
WINE_CUSTOM_CONF_OPTS += --with-osmesa
WINE_CUSTOM_DEPENDENCIES += mesa3d
else
WINE_CUSTOM_CONF_OPTS += --without-osmesa
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
WINE_CUSTOM_CONF_OPTS += --with-pulse
WINE_CUSTOM_DEPENDENCIES += pulseaudio
else
WINE_CUSTOM_CONF_OPTS += --without-pulse
endif

ifeq ($(BR2_PACKAGE_SAMBA4),y)
WINE_CUSTOM_CONF_OPTS += --with-netapi
WINE_CUSTOM_DEPENDENCIES += samba4
else
WINE_CUSTOM_CONF_OPTS += --without-netapi
endif

ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
WINE_CUSTOM_CONF_OPTS += --with-sane
WINE_CUSTOM_DEPENDENCIES += sane-backends
WINE_CUSTOM_CONF_ENV += SANE_CONFIG=$(STAGING_DIR)/usr/bin/sane-config
else
WINE_CUSTOM_CONF_OPTS += --without-sane
endif

ifeq ($(BR2_PACKAGE_SDL2),y)
WINE_CUSTOM_CONF_OPTS += --with-sdl
WINE_CUSTOM_DEPENDENCIES += sdl2
else
WINE_CUSTOM_CONF_OPTS += --without-sdl
endif

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
WINE_CUSTOM_CONF_OPTS += --with-udev
WINE_CUSTOM_DEPENDENCIES += udev
else
WINE_CUSTOM_CONF_OPTS += --without-udev
endif

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
    WINE_CUSTOM_CONF_OPTS += --with-vulkan
    WINE_CUSTOM_DEPENDENCIES += vulkan-headers vulkan-loader
else
    WINE_CUSTOM_CONF_OPTS += --without-vulkan
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
WINE_CUSTOM_CONF_OPTS += --with-x
WINE_CUSTOM_DEPENDENCIES += xlib_libX11
else
WINE_CUSTOM_CONF_OPTS += --without-x
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
WINE_CUSTOM_CONF_OPTS += --with-xcomposite
WINE_CUSTOM_DEPENDENCIES += xlib_libXcomposite
else
WINE_CUSTOM_CONF_OPTS += --without-xcomposite
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
WINE_CUSTOM_CONF_OPTS += --with-xcursor
WINE_CUSTOM_DEPENDENCIES += xlib_libXcursor
else
WINE_CUSTOM_CONF_OPTS += --without-xcursor
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
WINE_CUSTOM_CONF_OPTS += --with-xshape --with-xshm
WINE_CUSTOM_DEPENDENCIES += xlib_libXext
else
WINE_CUSTOM_CONF_OPTS += --without-xshape --without-xshm
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
WINE_CUSTOM_CONF_OPTS += --with-xinput --with-xinput2
WINE_CUSTOM_DEPENDENCIES += xlib_libXi
else
WINE_CUSTOM_CONF_OPTS += --without-xinput --without-xinput2
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
WINE_CUSTOM_CONF_OPTS += --with-xinerama
WINE_CUSTOM_DEPENDENCIES += xlib_libXinerama
else
WINE_CUSTOM_CONF_OPTS += --without-xinerama
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
WINE_CUSTOM_CONF_OPTS += --with-xrandr
WINE_CUSTOM_DEPENDENCIES += xlib_libXrandr
else
WINE_CUSTOM_CONF_OPTS += --without-xrandr
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
WINE_CUSTOM_CONF_OPTS += --with-xrender
WINE_CUSTOM_DEPENDENCIES += xlib_libXrender
else
WINE_CUSTOM_CONF_OPTS += --without-xrender
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
WINE_CUSTOM_CONF_OPTS += --with-xxf86vm
WINE_CUSTOM_DEPENDENCIES += xlib_libXxf86vm
else
WINE_CUSTOM_CONF_OPTS += --without-xxf86vm
endif

# host-gettext is essential for .po file support in host-wine wrc
ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
HOST_WINE_CUSTOM_DEPENDENCIES += host-gettext
HOST_WINE_CUSTOM_CONF_OPTS += --with-gettext --with-gettextpo
else
HOST_WINE_CUSTOM_CONF_OPTS += --without-gettext --without-gettextpo
endif

# Wine needs to enable 64-bit build tools on 64-bit host
ifeq ($(HOSTARCH),x86_64)
HOST_WINE_CUSTOM_CONF_OPTS += --enable-win64
endif

# Wine only needs the host tools to be built, so cut-down the
# build time by building just what we need.
define HOST_WINE_CUSTOM_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) __tooldeps__
endef

# Wine only needs its host variant to be built, not that it is
# installed, as it uses the tools from the build directory. But
# we have no way in Buildroot to state that a host package should
# not be installed. So, just provide an noop install command.
define HOST_WINE_CUSTOM_INSTALL_CMDS
	:
endef

# We are focused on the cross compiling tools, disable everything else
HOST_WINE_CUSTOM_CONF_OPTS += \
	--disable-tests \
	--disable-win16 \
	--without-alsa \
	--without-capi \
	--without-coreaudio \
	--without-cups \
	--without-dbus \
	--without-fontconfig \
	--without-gphoto \
	--without-gnutls \
	--without-gssapi \
	--without-gstreamer \
	--without-krb5 \
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
define WINE_CUSTOM_REMOVE_INCLUDES_HOOK
        rm -Rf $(TARGET_DIR)/usr/wine/ge-custom/include
endef

WINE_CUSTOM_POST_INSTALL_TARGET_HOOKS += WINE_CUSTOM_REMOVE_INCLUDES_HOOK

$(eval $(autotools-package))
$(eval $(host-autotools-package))
