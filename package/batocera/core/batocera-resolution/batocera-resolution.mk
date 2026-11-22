################################################################################
#
# batocera-resolution
#
################################################################################

BATOCERA_RESOLUTION_VERSION = 1.6
BATOCERA_RESOLUTION_LICENSE = GPL
BATOCERA_RESOLUTION_DEPENDENCIES = pciutils
BATOCERA_RESOLUTION_SOURCE =
BATOCERA_RESOLUTION_PATH = $(BATOCERA_RESOLUTION_PKGDIR)/scripts

BATOCERA_RESOLUTION_SCRIPT_TYPE = drm

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
BATOCERA_RESOLUTION_SCRIPT_TYPE = xorg
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND_LABWC),y)
BATOCERA_RESOLUTION_SCRIPT_TYPE = wayland-labwc
BATOCERA_RESOLUTION_DEPENDENCIES += grim wf-recorder
endif

define BATOCERA_RESOLUTION_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BATOCERA_RESOLUTION_PATH)/resolution/batocera-resolution.$(BATOCERA_RESOLUTION_SCRIPT_TYPE) $(TARGET_DIR)/usr/bin/batocera-resolution
	$(INSTALL) -D -m 0755 $(BATOCERA_RESOLUTION_PATH)/screenshot/batocera-screenshot.$(BATOCERA_RESOLUTION_SCRIPT_TYPE) $(TARGET_DIR)/usr/bin/batocera-screenshot
	$(INSTALL) -D -m 0755 $(BATOCERA_RESOLUTION_PATH)/screenshot/batocera-flash-screen.py $(TARGET_DIR)/usr/bin/batocera-flash-screen
endef

define BATOCERA_RESOLUTION_INSTALL_RK3128
	$(INSTALL) -D -m 0755 $(BATOCERA_RESOLUTION_PATH)/resolution/batocera-resolution-post-rk3128 $(TARGET_DIR)/usr/bin/batocera-resolution-post
endef

define BATOCERA_RESOLUTION_INSTALL_XORG
	mkdir -p $(TARGET_DIR)/etc/X11/xorg.conf.d
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/board/batocera/x86/fsoverlay/etc/X11/xorg.conf.d/20-amdgpu.conf $(TARGET_DIR)/etc/X11/xorg.conf.d/20-amdgpu.conf
endef

define BATOCERA_RESOLUTION_INSTALL_RECORDER
	$(INSTALL) -D -m 0755 $(BATOCERA_RESOLUTION_PATH)/recorder/batocera-record.$(BATOCERA_RESOLUTION_SCRIPT_TYPE) $(TARGET_DIR)/usr/bin/batocera-record
endef

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3128),y)
BATOCERA_RESOLUTION_POST_INSTALL_TARGET_HOOKS += BATOCERA_RESOLUTION_INSTALL_RK3128
endif

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
BATOCERA_RESOLUTION_POST_INSTALL_TARGET_HOOKS += BATOCERA_RESOLUTION_INSTALL_XORG
endif

ifneq ($(BR2_PACKAGE_XSERVER_XORG_SERVER)$(BR2_PACKAGE_BATOCERA_WAYLAND_LABWC),)
BATOCERA_RESOLUTION_POST_INSTALL_TARGET_HOOKS += BATOCERA_RESOLUTION_INSTALL_RECORDER
endif

$(eval $(generic-package))
