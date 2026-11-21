################################################################################
#
# batocera-scripts
#
################################################################################

BATOCERA_SCRIPTS_VERSION = 4.3
BATOCERA_SCRIPTS_LICENSE = GPL
BATOCERA_SCRIPTS_SOURCE =
BATOCERA_SCRIPTS_DEPENDENCIES = pciutils

BATOCERA_SCRIPTS_SRC = $(BATOCERA_SCRIPTS_PKGDIR)scripts

# Scripts installed to /usr/bin on every board, relative to scripts/
BATOCERA_SCRIPTS_BIN = \
	batocera-amd-tdp \
	batocera-architecture-compatibility \
	batocera-autologin \
	batocera-brightness \
	batocera-config \
	batocera-cores \
	batocera-cpucores \
	batocera-cpucores-toggle \
	batocera-encode \
	batocera-es-swissknife \
	batocera-es-thebezelproject \
	batocera-es-web-notifier \
	batocera-format \
	batocera-gameforce \
	batocera-ikemen \
	batocera-info \
	batocera-install \
	batocera-keyboard \
	batocera-kodi \
	batocera-kodilauncher \
	batocera-mitigations \
	batocera-model \
	batocera-mount \
	batocera-overclock \
	batocera-padsinfo \
	batocera-part \
	batocera-planemode \
	batocera-save-overlay \
	batocera-services \
	batocera-shutdown \
	batocera-spinner-calibrator \
	batocera-storage-manager \
	batocera-storage-udev \
	batocera-store \
	batocera-streaming \
	batocera-support \
	batocera-switch-screen-checker \
	batocera-switch-screen-checker-delayed \
	batocera-sync \
	batocera-systems \
	batocera-temp \
	batocera-timezone \
	batocera-upgrade \
	batocera-version \
	batocera-vulkan \
	batocera-wifi \
	batocera-xtract \
	battery_led_status \
	bluetooth/batocera-bluetooth \
	bluetooth/batocera-bluetooth-agent \
	getLocalWaylandDisplay \
	getLocalXDisplay

# Mouse helper: labwc takes precedence when both display servers are enabled
ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND_LABWC),y)
	BATOCERA_SCRIPTS_MOUSE_TYPE = wayland-labwc
	BATOCERA_SCRIPTS_DEPENDENCIES += wtype
else ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
	BATOCERA_SCRIPTS_MOUSE_TYPE = xorg
endif

ifneq ($(BATOCERA_SCRIPTS_MOUSE_TYPE),)
define BATOCERA_SCRIPTS_INSTALL_MOUSE
	$(INSTALL) -D -m 0755 $(BATOCERA_SCRIPTS_SRC)/batocera-mouse.$(BATOCERA_SCRIPTS_MOUSE_TYPE) \
		$(TARGET_DIR)/usr/bin/batocera-mouse
endef
	BATOCERA_SCRIPTS_POST_INSTALL_TARGET_HOOKS += BATOCERA_SCRIPTS_INSTALL_MOUSE
endif

# PiBoy replaces the generic batocera-info
ifeq ($(BR2_PACKAGE_XPI_GAMECON_RPI),y)
define BATOCERA_SCRIPTS_INSTALL_GAMECON_RPI
	$(INSTALL) -D -m 0755 $(BATOCERA_SCRIPTS_SRC)/batocera-info.piboy \
		$(TARGET_DIR)/usr/bin/batocera-info
endef
BATOCERA_SCRIPTS_POST_INSTALL_TARGET_HOOKS += BATOCERA_SCRIPTS_INSTALL_GAMECON_RPI
endif

# Qualcomm boards
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_SDM845)$(BR2_PACKAGE_BATOCERA_TARGET_SM4450)$(BR2_PACKAGE_BATOCERA_TARGET_SM8250)$(BR2_PACKAGE_BATOCERA_TARGET_SM8550)$(BR2_PACKAGE_BATOCERA_TARGET_SM8650)$(BR2_PACKAGE_BATOCERA_TARGET_SM8750),y)
	BATOCERA_SCRIPTS_BIN += qcom-fan batocera-install-internal
endif

# Mangmi (SM6115)
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_SM6115),y)
	BATOCERA_SCRIPTS_BIN += mangmi_fan_control.py
endif

# RK3588 mainline
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588_MAINLINE),y)
	BATOCERA_SCRIPTS_BIN += rk3588-fan
endif

define BATOCERA_SCRIPTS_INSTALL_TARGET_CMDS
	$(foreach f,$(BATOCERA_SCRIPTS_BIN),
		$(INSTALL) -D -m 0755 $(BATOCERA_SCRIPTS_SRC)/$(f) $(TARGET_DIR)/usr/bin/$(notdir $(f)))
	$(INSTALL) -D -m 0644 $(BATOCERA_SCRIPTS_SRC)/bluetooth/bluezutils.py \
		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/bluezutils.py
	$(INSTALL) -D -m 0755 $(BATOCERA_SCRIPTS_SRC)/95battery-led \
		$(TARGET_DIR)/etc/pm/sleep.d/95battery-led
	$(INSTALL) -D -m 0644 $(BATOCERA_SCRIPTS_PKGDIR)rules/80-switch-screen.rules \
		$(TARGET_DIR)/etc/udev/rules.d/80-switch-screen.rules
	ln -sf /usr/bin/batocera-xtract $(TARGET_DIR)/usr/bin/file-roller
endef

$(eval $(generic-package))
