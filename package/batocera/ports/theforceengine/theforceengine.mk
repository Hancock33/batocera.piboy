################################################################################
#
# theforceengine
#
################################################################################
# Version: Commits on Aug 29, 2024
THEFORCEENGINE_VERSION = 604af203c73eaa729e27f07bd50fc4a427db0f5e
THEFORCEENGINE_SITE = $(call github,luciusDXL,TheForceEngine,$(THEFORCEENGINE_VERSION))
THEFORCEENGINE_LICENSE = GPLv2
THEFORCEENGINE_LICENSE_FILE = LICENSE

# be sure to update configgen if the patch version changes
THEFORCEENGINE_PATCH_VERSION = v3
THEFORCEENGINE_PATCH_SOURCE = $(THEFORCEENGINE_PATCH_VERSION).zip
THEFORCEENGINE_EXTRA_DOWNLOADS = \
    $(addprefix \
    https://df-21.net/downloads/patches/$(THEFORCEENGINE_PATCH_VERSION)/,\
    $(THEFORCEENGINE_PATCH_SOURCE))

THEFORCEENGINE_DEPENDENCIES = libglew sdl2

THEFORCEENGINE_SUPPORTS_IN_SOURCE_BUILD = NO

THEFORCEENGINE_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
THEFORCEENGINE_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
THEFORCEENGINE_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
THEFORCEENGINE_CONF_OPTS += -DDISABLE_SYSMIDI=ON

ifeq ($(BR2_PACKAGE_RTMIDI),y)
    THEFORCEENGINE_DEPENDENCIES += rtmidi
    THEFORCEENGINE_CONF_OPTS += -DDISABLE_SYSMIDI=OFF
endif

THEFORCEENGINE_CONF_INIT = $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/theforceengine/

define THEFORCEENGINE_INSTALL_TARGET_CMDS
    mkdir -p $(THEFORCEENGINE_CONF_INIT)
    $(INSTALL) -m 0755 -D $(@D)/buildroot-build/theforceengine \
        $(TARGET_DIR)/usr/bin/theforceengine
    rsync -arv $(@D)/TheForceEngine/Captions $(THEFORCEENGINE_CONF_INIT)
    rsync -arv $(@D)/TheForceEngine/Documentation $(THEFORCEENGINE_CONF_INIT)
    rsync -arv $(@D)/TheForceEngine/UI_Text $(THEFORCEENGINE_CONF_INIT)
    rsync -arv $(@D)/TheForceEngine/UI_Images $(THEFORCEENGINE_CONF_INIT)
    rsync -arv $(@D)/TheForceEngine/Shaders $(THEFORCEENGINE_CONF_INIT)
    rsync -arv $(@D)/TheForceEngine/SoundFonts $(THEFORCEENGINE_CONF_INIT)
    rsync -arv $(@D)/TheForceEngine/Fonts $(THEFORCEENGINE_CONF_INIT)
    rsync -arv --exclude 'CMakeLists.txt' $(@D)/TheForceEngine/Mods $(THEFORCEENGINE_CONF_INIT)
endef

define THEFORCEENGINE_PATCH_ZIP
    mkdir -p $(THEFORCEENGINE_CONF_INIT)/Mods
    cp $(THEFORCEENGINE_DL_DIR)/$(THEFORCEENGINE_PATCH_SOURCE) \
        $(THEFORCEENGINE_CONF_INIT)/Mods
endef

define THEFORCEENGINE_EVMAPY
    mkdir -p $(TARGET_DIR)/usr/share/evmapy
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/theforceengine/theforceengine.keys \
        $(TARGET_DIR)/usr/share/evmapy
endef

THEFORCEENGINE_POST_INSTALL_TARGET_HOOKS += THEFORCEENGINE_PATCH_ZIP
THEFORCEENGINE_POST_INSTALL_TARGET_HOOKS += THEFORCEENGINE_EVMAPY

$(eval $(cmake-package))
