################################################################################
#
# vcmi
#
################################################################################
# Version: Commits on Feb 13, 2026
VCMI_VERSION = 1.7.2
VCMI_BRANCH = develop
VCMI_SITE = https://github.com/vcmi/vcmi.git
VCMI_SITE_METHOD=git
VCMI_GIT_SUBMODULES=YES
VCMI_EMULATOR_INFO = vcmi.emulator.yml
VCMI_DEPENDENCIES = boost ffmpeg libsquish minizip sdl2 sdl2_image sdl2_mixer sdl2_ttf tbb

VCMI_CONF_OPTS += -DENABLE_EDITOR=OFF
VCMI_CONF_OPTS += -DENABLE_GITVERSION=OFF
VCMI_CONF_OPTS += -DENABLE_LAUNCHER=OFF
VCMI_CONF_OPTS += -DENABLE_MMAI=OFF
VCMI_CONF_OPTS += -DENABLE_STATIC_AI_LIBS=ON
VCMI_CONF_OPTS += -DstaticAI=ON
VCMI_CONF_OPTS += -DTBB_ROOT=$(STAGING_DIR)/usr/lib/tbb

define VCMI_EVMAPY
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/vcmi/vcmi.keys $(TARGET_DIR)/usr/share/evmapy
endef

VCMI_POST_INSTALL_TARGET_HOOKS += VCMI_EVMAPY

$(eval $(cmake-package))
$(eval $(emulator-info-package))
