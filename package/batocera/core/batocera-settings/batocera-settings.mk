################################################################################
#
# batocera-settings
#
################################################################################
# Version: Commits on May 22, 2021
BATOCERA_SETTINGS_VERSION = 0.0.5
BATOCERA_SETTINGS_LICENSE = MIT
BATOCERA_SETTINGS_SITE = $(call github,batocera-linux,mini_settings,$(BATOCERA_SETTINGS_VERSION))
BATOCERA_SETTINGS_CONF_OPTS = \
	-Ddefault_config_path=/userdata/system/batocera.conf \
	-Dget_exe_name=batocera-settings-get \
	-Dset_exe_name=batocera-settings-set

define BATOCERA_SETTINGS_MASTER_BIN
	$(INSTALL) -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-settings/batocera-settings-get-master $(TARGET_DIR)/usr/bin/batocera-settings-get-master
	$(INSTALL) -m 0755 $(@D)/buildroot-build/batocera-settings-get $(TARGET_DIR)/usr/bin/batocera-settings-get
	$(INSTALL) -m 0755 $(@D)/buildroot-build/batocera-settings-set $(TARGET_DIR)/usr/bin/batocera-settings-set
endef

BATOCERA_SETTINGS_POST_INSTALL_TARGET_HOOKS += BATOCERA_SETTINGS_MASTER_BIN

$(eval $(meson-package))
