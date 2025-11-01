################################################################################
#
# shadps4-qtlauncher
#
################################################################################
# Version: Commits on Oct 26, 2025
SHADPS4_QTLAUNCHER_VERSION = 55bb7f7b9d0cf4cf476b5163fb3cb666e6c267f5
SHADPS4_QTLAUNCHER_SITE = https://github.com/shadps4-emu/shadps4-qtlauncher.git
SHADPS4_QTLAUNCHER_SITE_METHOD=git
SHADPS4_QTLAUNCHER_GIT_SUBMODULES=YES
SHADPS4_QTLAUNCHER_LICENSE = GPLv2
SHADPS4_QTLAUNCHER_LICENSE_FILE = LICENSE
SHADPS4_QTLAUNCHER_DEPENDENCIES += qt6base qt6multimedia qt6svg qt6tools shadps4

SHADPS4_QTLAUNCHER_SUPPORTS_IN_SOURCE_BUILD = NO

SHADPS4_QTLAUNCHER_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
SHADPS4_QTLAUNCHER_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SHADPS4_QTLAUNCHER_CONF_OPTS += -DENABLE_UPDATER=OFF

define SHADPS4_QTLAUNCHER_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/shadps4
	$(INSTALL) -m 0755 $(@D)/buildroot-build/shadPS4QtLauncher $(TARGET_DIR)/usr/bin/shadps4/
	cp -pr $(@D)/buildroot-build/translations $(TARGET_DIR)/usr/bin/shadps4/
endef

$(eval $(cmake-package))
