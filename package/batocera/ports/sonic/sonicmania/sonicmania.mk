################################################################################
#
# sonicmania
#
################################################################################
# Version: Commits on Aug 07, 2024
SONICMANIA_VERSION = ae3982c4c45877a01635056f6c28f72e5b545c6d
SONICMANIA_SITE = https://github.com/RSDKModding/Sonic-Mania-Decompilation
SONICMANIA_SITE_METHOD = git
SONICMANIA_GIT_SUBMODULES = YES
SONICMANIA_LICENSE = Proprietary
SONICMANIA_LICENSE_FILE = LICENSE.md

SONICMANIA_DEPENDENCIES += libglu libglew libglfw libogg libtheora portaudio

SONICMANIA_SUPPORTS_IN_SOURCE_BUILD = NO

SONICMANIA_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
SONICMANIA_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SONICMANIA_CONF_OPTS += -DGAME_STATIC=ON
SONICMANIA_CONF_OPTS += -DRETRO_OUTPUT_NAME=sonicmania

define SONICMANIA_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/dependencies/RSDKv5/sonicmania \
		$(TARGET_DIR)/usr/bin/sonicmania
endef

define SONICMANIA_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/sonicmania/sonicmania.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

SONICMANIA_POST_INSTALL_TARGET_HOOKS += SONICMANIA_EVMAPY

$(eval $(cmake-package))
