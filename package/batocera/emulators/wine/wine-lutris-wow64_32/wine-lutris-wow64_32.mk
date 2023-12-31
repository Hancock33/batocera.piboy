################################################################################
#
# wine-lutris-wow64_32
#
################################################################################
# Version: Commits on Dec 27, 2023
WINE_LUTRIS_WOW64_32_VERSION = 91a29134ff35c0a6e388329ea819dd73651062b1
WINE_LUTRIS_WOW64_32_STAGING_VERSION = $(subst wine-,,$(WINE_LUTRIS_WOW64_32_VERSION))
WINE_LUTRIS_WOW64_32_SOURCE = wine-$(WINE_LUTRIS_WOW64_32_VERSION).tar.gz
WINE_LUTRIS_WOW64_32_SITE = $(call github,wine-mirror,wine,$(WINE_LUTRIS_WOW64_32_VERSION))
WINE_LUTRIS_WOW64_32_LICENSE = LGPL-2.1+
WINE_LUTRIS_WOW64_32_LICENSE_FILES = COPYING.LIB LICENSE
WINE_LUTRIS_WOW64_32_CPE_ID_VENDOR = winehq
WINE_LUTRIS_WOW64_32_SELINUX_MODULES = wine
WINE_LUTRIS_WOW64_32_DEPENDENCIES = host-bison host-flex host-wine-lutris
HOST_WINE_LUTRIS_WOW64_32_DEPENDENCIES = host-bison host-flex host-clang host-lld
#HOST_WINE_LUTRIS_EXTRA_DOWNLOADS = https://github.com/wine-staging/wine-staging/archive/refs/tags/v$(WINE_LUTRIS_WOW64_32_STAGING_VERSION).tar.gz

# Configure Lutris
define WINE_LUTRIS_WOW64_32_AUTOGEN
	# Add Version
	$(SED) "s|The Wine configuration|Wine-86-$(WINE_LUTRIS_WOW64_32_VERSION) config|g" $(@D)/programs/wineboot/wineboot.rc
	$(SED) "s|IDD_WAITDLG DIALOG 0, 0, 200, 50|IDD_WAITDLG DIALOG 0, 0, 300, 30|g" $(@D)/programs/wineboot/wineboot.rc
	$(SED) "s|IDC_WAITTEXT, 40, 5, 150, 40|IDC_WAITTEXT, 40, 5, 250, 15|g" $(@D)/programs/wineboot/wineboot.rc
	$(SED) "s|FONT 8,|FONT 14,|g" $(@D)/programs/wineboot/wineboot.rc
	# Create folder for install
	mkdir -p $(TARGET_DIR)/usr/wine/lutris
	# Use Staging Patches
	#printf "%s\n" "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) Patching wine-staging" >&2
	#tar -xf $(WINE_LUTRIS_DL_DIR)/v$(WINE_LUTRIS_WOW64_32_STAGING_VERSION).tar.gz -C $(@D)
	#cd $(@D); ./wine-staging-$(WINE_LUTRIS_WOW64_32_STAGING_VERSION)/staging/patchinstall.py --all
	# Autotools generation
	cd $(@D); autoreconf -fiv
	cd $(@D); ./tools/make_requests
	cd $(@D); ./dlls/winevulkan/make_vulkan && rm dlls/winevulkan/vk-*.xml
endef

WINE_LUTRIS_WOW64_32_PRE_CONFIGURE_HOOKS += WINE_LUTRIS_WOW64_32_AUTOGEN
HOST_WINE_LUTRIS_WOW64_32_PRE_CONFIGURE_HOOKS += WINE_LUTRIS_WOW64_32_AUTOGEN

# Wine needs its own directory structure and tools for cross compiling
WINE_LUTRIS_WOW64_32_CONF_OPTS = LDFLAGS="-Wl,--no-as-needed -lm" CPPFLAGS="-DMPG123_NO_LARGENAME=1" \
	--with-wine-tools=../host-wine-lutris-$(WINE_LUTRIS_WOW64_32_VERSION) \
	--disable-tests \
	--disable-win64 \
	--without-capi \
	--without-coreaudio \
	--without-gettext \
	--without-gettextpo \
	--without-gphoto \
	--without-mingw \
	--without-opencl \
	--without-oss \
	--prefix=/usr/wine/lutris \
	--exec-prefix=/usr/wine/lutris

# Add Vulkan if available
ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-vulkan
WINE_LUTRIS_WOW64_32_DEPENDENCIES += vulkan-headers vulkan-loader
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-vulkan
endif
# TODO Add DXVK if available

# Wine uses a wrapper around gcc, and uses the value of --host to
# construct the filename of the gcc to call.  But for external
# toolchains, the GNU_TARGET_NAME tuple that we construct from our
# internal variables may differ from the actual gcc prefix for the
# external toolchains. So, we have to override whatever the gcc
# wrapper believes what the real gcc is named, and force the tuple of
# the external toolchain, not the one we compute in GNU_TARGET_NAME.
ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += TARGETFLAGS="-b $(TOOLCHAIN_EXTERNAL_PREFIX)"
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-alsa
WINE_LUTRIS_WOW64_32_DEPENDENCIES += alsa-lib
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-alsa
endif

ifeq ($(BR2_PACKAGE_CUPS),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-cups
WINE_LUTRIS_WOW64_32_DEPENDENCIES += cups
WINE_LUTRIS_WOW64_32_CONF_ENV += CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-cups
endif

ifeq ($(BR2_PACKAGE_DBUS),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-dbus
WINE_LUTRIS_WOW64_32_DEPENDENCIES += dbus
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-dbus
endif

ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-fontconfig
WINE_LUTRIS_WOW64_32_DEPENDENCIES += fontconfig
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-fontconfig
endif

# To support freetype in wine we also need freetype in host-wine for the cross compiling tools
ifeq ($(BR2_PACKAGE_FREETYPE),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-freetype
HOST_WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-freetype
WINE_LUTRIS_WOW64_32_DEPENDENCIES += freetype
HOST_WINE_LUTRIS_WOW64_32_DEPENDENCIES += host-freetype
WINE_LUTRIS_WOW64_32_CONF_ENV += FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-freetype
HOST_WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-freetype
endif

ifeq ($(BR2_PACKAGE_GNUTLS),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-gnutls
WINE_LUTRIS_WOW64_32_DEPENDENCIES += gnutls
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-gnutls
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-gstreamer
WINE_LUTRIS_WOW64_32_DEPENDENCIES += gst1-plugins-base
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-gstreamer
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-opengl
WINE_LUTRIS_WOW64_32_DEPENDENCIES += libgl
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-opengl
endif

ifeq ($(BR2_PACKAGE_LIBKRB5),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-krb5
WINE_LUTRIS_WOW64_32_DEPENDENCIES += libkrb5
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-krb5
endif

ifeq ($(BR2_PACKAGE_LIBPCAP),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-pcap
WINE_LUTRIS_WOW64_32_DEPENDENCIES += libpcap
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-pcap
endif

ifeq ($(BR2_PACKAGE_LIBUSB),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-usb
WINE_LUTRIS_WOW64_32_DEPENDENCIES += libusb
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-usb
endif

ifeq ($(BR2_PACKAGE_LIBV4L),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-v4l2
WINE_LUTRIS_WOW64_32_DEPENDENCIES += libv4l
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-v4l2
endif

ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_CLASSIC),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-osmesa
WINE_LUTRIS_WOW64_32_DEPENDENCIES += mesa3d
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-osmesa
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-pulse
WINE_LUTRIS_WOW64_32_DEPENDENCIES += pulseaudio
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-pulse
endif

ifeq ($(BR2_PACKAGE_SAMBA4),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-netapi
WINE_LUTRIS_WOW64_32_DEPENDENCIES += samba4
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-netapi
endif

ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-sane
WINE_LUTRIS_WOW64_32_DEPENDENCIES += sane-backends
WINE_LUTRIS_WOW64_32_CONF_ENV += SANE_CONFIG=$(STAGING_DIR)/usr/bin/sane-config
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-sane
endif

ifeq ($(BR2_PACKAGE_SDL2),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-sdl
WINE_LUTRIS_WOW64_32_DEPENDENCIES += sdl2
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-sdl
endif

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-udev
WINE_LUTRIS_WOW64_32_DEPENDENCIES += udev
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-udev
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-x
WINE_LUTRIS_WOW64_32_DEPENDENCIES += xlib_libX11
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-x
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-xcomposite
WINE_LUTRIS_WOW64_32_DEPENDENCIES += xlib_libXcomposite
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-xcomposite
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-xcursor
WINE_LUTRIS_WOW64_32_DEPENDENCIES += xlib_libXcursor
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-xcursor
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-xshape --with-xshm
WINE_LUTRIS_WOW64_32_DEPENDENCIES += xlib_libXext
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-xshape --without-xshm
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-xinput --with-xinput2
WINE_LUTRIS_WOW64_32_DEPENDENCIES += xlib_libXi
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-xinput --without-xinput2
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-xinerama
WINE_LUTRIS_WOW64_32_DEPENDENCIES += xlib_libXinerama
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-xinerama
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-xrandr
WINE_LUTRIS_WOW64_32_DEPENDENCIES += xlib_libXrandr
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-xrandr
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-xrender
WINE_LUTRIS_WOW64_32_DEPENDENCIES += xlib_libXrender
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-xrender
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-xxf86vm
WINE_LUTRIS_WOW64_32_DEPENDENCIES += xlib_libXxf86vm
else
WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-xxf86vm
endif

# Cleanup final directory
define WINE_LUTRIS_WOW64_32_REMOVE_INCLUDES_HOOK
		rm -Rf $(TARGET_DIR)/usr/wine/lutris/include
endef

WINE_LUTRIS_WOW64_32_POST_INSTALL_TARGET_HOOKS += WINE_LUTRIS_WOW64_32_REMOVE_INCLUDES_HOOK

# host-gettext is essential for .po file support in host-wine wrc
ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
HOST_WINE_LUTRIS_WOW64_32_DEPENDENCIES += host-gettext
HOST_WINE_LUTRIS_WOW64_32_CONF_OPTS += --with-gettext --with-gettextpo
else
HOST_WINE_LUTRIS_WOW64_32_CONF_OPTS += --without-gettext --without-gettextpo
endif

# Wine needs to enable 64-bit build tools on 64-bit host
ifeq ($(HOSTARCH),x86_64)
HOST_WINE_LUTRIS_WOW64_32_CONF_OPTS += --enable-win64
endif

# Wine only needs the host tools to be built, so cut-down the
# build time by building just what we need.
define HOST_WINE_LUTRIS_WOW64_32_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) __tooldeps__
endef

# Wine only needs its host variant to be built, not that it is
# installed, as it uses the tools from the build directory. But
# we have no way in Buildroot to state that a host package should
# not be installed. So, just provide an noop install command.
define HOST_WINE_LUTRIS_WOW64_32_INSTALL_CMDS
	:
endef

# We are focused on the cross compiling tools, disable everything else
HOST_WINE_LUTRIS_WOW64_32_CONF_OPTS += \
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

$(eval $(autotools-package))
$(eval $(host-autotools-package))
