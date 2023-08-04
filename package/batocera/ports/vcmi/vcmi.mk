################################################################################
#
# vcmi
#
################################################################################
# Version: Commits on Aug 04, 2023 (branch@master)
VCMI_VERSION = b9729241f1018b4a07f880b319da32f94bf6409b
VCMI_SITE = https://github.com/vcmi/vcmi.git
VCMI_SITE_METHOD=git
VCMI_GIT_SUBMODULES=YES
VCMI_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_ttf ffmpeg tbb boost host-ninja

VCMI_CONF_OPTS += -DENABLE_TEST=OFF -DENABLE_LAUNCHER=OFF -DENABLE_EDITOR=OFF -DENABLE_GITVERSION=OFF -GNinja

define VCMI_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(VCMI_BUILDDIR)
endef

define VCMI_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(VCMI_BUILDDIR)
endef

define VCMI_EVMAPY
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/vcmi/vcmi.keys $(TARGET_DIR)/usr/share/evmapy
endef

VCMI_POST_INSTALL_TARGET_HOOKS += VCMI_EVMAPY

$(eval $(cmake-package))
