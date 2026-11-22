################################################################################
#
# batocera-settings
#
################################################################################
# Version: Commits on Oct 21, 2026
BATOCERA_SETTINGS_VERSION = 0.0.6
BATOCERA_SETTINGS_LICENSE = MIT
BATOCERA_SETTINGS_SITE = $(call github,batocera-linux,mini_settings,$(BATOCERA_SETTINGS_VERSION))
BATOCERA_SETTINGS_CONF_OPTS = \
	-Ddefault_config_path=/userdata/system/batocera.conf \
	-Dget_exe_name=batocera-settings-get \
	-Dset_exe_name=batocera-settings-set

define BATOCERA_SETTINGS_MASTER_BIN
	$(INSTALL) -D -m 0755 $(BATOCERA_SETTINGS_PKGDIR)/batocera-settings-get-master $(TARGET_DIR)/usr/bin/batocera-settings-get-master
	$(INSTALL) -D -m 0755 -t $(TARGET_DIR)/usr/bin $(@D)/buildroot-build/batocera-settings-get $(@D)/buildroot-build/batocera-settings-set
endef

BATOCERA_SETTINGS_POST_INSTALL_TARGET_HOOKS += BATOCERA_SETTINGS_MASTER_BIN

$(eval $(meson-package))
