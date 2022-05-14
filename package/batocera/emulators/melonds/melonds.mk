################################################################################
#
# MELONDS
#
################################################################################
# Version: Commits on May 13, 2022
MELONDS_VERSION = 4cc34121b0db2cf77541014271af8d79fed35f26
MELONDS_SITE = https://github.com/Arisotura/melonDS.git
MELONDS_SITE_METHOD=git
MELONDS_GIT_SUBMODULES=YES
MELONDS_LICENSE = GPLv2
MELONDS_DEPENDENCIES = sdl2 qt5base slirp

# Should be set when the package cannot be built inside the source tree but needs a separate build directory.
MELONDS_SUPPORTS_IN_SOURCE_BUILD = NO

MELONDS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

MELONDS_CONF_ENV += LDFLAGS=-lpthread

define MELONDS_INSTALL_TARGET_CMDS
        mkdir -p $(TARGET_DIR)/usr/bin
	$(INSTALL) -D $(@D)/buildroot-build/melonDS \
		$(TARGET_DIR)/usr/bin/

endef

define MELONDS_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/melonds/nds.melonds.keys $(TARGET_DIR)/usr/share/evmapy
endef

MELONDS_POST_INSTALL_TARGET_HOOKS += MELONDS_POST_PROCESS

$(eval $(cmake-package))
