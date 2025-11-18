################################################################################
#
# mangohud
#
################################################################################
# Version: Commits on Nov 18, 2025
MANGOHUD_VERSION = 7ada82625b38bff2b63d12e15378ca5e0101d05e
MANGOHUD_SITE =  $(call github,flightlessmango,MangoHud,$(MANGOHUD_VERSION))

MANGOHUD_DEPENDENCIES += host-python-mako host-glslang dbus
MANGOHUD_DEPENDENCIES += json-for-modern-cpp

ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
    MANGOHUD_DEPENDENCIES += libxkbcommon
endif

ifeq ($(BR2_PACKAGE_LIBDRM),y)
MANGOHUD_DEPENDENCIES += libdrm
endif

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
MANGOHUD_DEPENDENCIES += xserver_xorg-server
endif

MANGOHUD_CONF_ENV += SSL_CERT_DIR=/etc/ssl/certs
MANGOHUD_CONF_OPTS = -Dwith_xnvctrl=disabled -Dtests=disabled

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
MANGOHUD_DEPENDENCIES += vulkan-headers
MANGOHUD_CONF_OPTS += -Duse_vulkan=true
else
MANGOHUD_CONF_OPTS += -Duse_vulkan=false
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
MANGOHUD_CONF_OPTS += -Dwith_x11=enabled
else
MANGOHUD_CONF_OPTS += -Dwith_x11=disabled
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
MANGOHUD_DEPENDENCIES += wayland
MANGOHUD_CONF_OPTS += -Dwith_wayland=enabled
else
MANGOHUD_CONF_OPTS += -Dwith_wayland=disabled
endif

define MANGOHUD_POST_INSTALL_CLEAN
	rm -f $(TARGET_DIR)/usr/share/man/man1/mangohud.1
endef
MANGOHUD_POST_INSTALL_TARGET_HOOKS = MANGOHUD_POST_INSTALL_CLEAN

$(eval $(meson-package))
