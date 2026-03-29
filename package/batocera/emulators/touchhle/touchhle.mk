################################################################################
#
# touchhle
#
################################################################################
# Version: Commits on Mar 21, 2026
TOUCHHLE_VERSION = 3696dd38428f8857eb35e78721c9e6ae686caaa1
TOUCHHLE_SITE = https://github.com/touchHLE/touchHLE.git
TOUCHHLE_SITE_METHOD = git
TOUCHHLE_GIT_SUBMODULES = YES
TOUCHHLE_LICENSE = MPL-2.0, GPL-3.0+
TOUCHHLE_LICENSE_FILES = LICENSE
TOUCHHLE_EMULATOR_INFO = touchhle.emulator.yml
TOUCHHLE_DEPENDENCIES = boost host-cmake openal sdl2

TOUCHHLE_CARGO_BUILD_OPTS = --no-default-features
TOUCHHLE_CARGO_ENV = CMAKE=$(HOST_DIR)/bin/cmake
TOUCHHLE_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
TOUCHHLE_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(TOUCHHLE_CARGO_MODE)

define TOUCHHLE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/touchhle/touchHLE_apps
	$(INSTALL) -D -m 0755 $(@D)/$(TOUCHHLE_BIN_DIR)/touchHLE $(TARGET_DIR)/usr/bin/touchHLE
	$(INSTALL) -D -m 0644 $(@D)/touchHLE_default_options.txt $(TARGET_DIR)/usr/share/touchhle/touchHLE_default_options.txt
	$(INSTALL) -D -m 0644 $(@D)/touchHLE_options.txt         $(TARGET_DIR)/usr/share/touchhle/touchHLE_options.txt
	$(INSTALL) -D -m 0644 $(@D)/OPTIONS_HELP.txt             $(TARGET_DIR)/usr/share/touchhle/OPTIONS_HELP.txt
	$(INSTALL) -D -m 0644 $(@D)/touchHLE_apps/README.txt     $(TARGET_DIR)/usr/share/touchhle/touchHLE_apps/README.txt
	rm -rf $(TARGET_DIR)/usr/share/touchhle/touchHLE_dylibs  $(TARGET_DIR)/usr/share/touchhle/touchHLE_fonts
	cp -a $(@D)/touchHLE_dylibs $(TARGET_DIR)/usr/share/touchhle/
	cp -a $(@D)/touchHLE_fonts $(TARGET_DIR)/usr/share/touchhle/
endef

$(eval $(cargo-package))
$(eval $(emulator-info-package))
