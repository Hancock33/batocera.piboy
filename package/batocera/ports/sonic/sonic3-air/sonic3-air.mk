################################################################################
#
# sonic3-air
#
################################################################################
# Version: Commits on Feb 21, 2026
SONIC3_AIR_VERSION = 36ce67dd58098287fde7fda689dec1c01678ae8b
SONIC3_AIR_SITE = $(call github,Eukaryot,sonic3air,$(SONIC3_AIR_VERSION))
SONIC3_AIR_LICENSE = GPL-3.0
SONIC3_AIR_LICENSE_FILE = COPYING.txt
SONIC3_AIR_EMULATOR_INFO = sonic3-air.emulator.yml
# CMakeLists.txt in subfolder
SONIC3_AIR_SUBDIR = Oxygen/sonic3air/build/_cmake

SONIC3_AIR_DEPENDENCIES += alsa-lib libcurl libglu mesa3d pulseaudio
SONIC3_AIR_DEPENDENCIES += xlib_libXcomposite xlib_libXxf86vm

SONIC3_AIR_SUPPORTS_IN_SOURCE_BUILD = NO

SONIC3_AIR_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SONIC3_AIR_CONF_OPTS += -DUSE_DISCORD=OFF

define SONIC3_AIR_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/sonic3-air
	mkdir -p $(TARGET_DIR)/usr/bin/sonic3-air
	# copy binary
	cp $(@D)/Oxygen/sonic3air/sonic3air_linux $(TARGET_DIR)/usr/bin/sonic3-air
	# copy config files
	cp $(@D)/Oxygen/sonic3air/config.json $(TARGET_DIR)/usr/bin/sonic3-air
	cp $(@D)/Oxygen/sonic3air/oxygenproject.json $(TARGET_DIR)/usr/bin/sonic3-air
	# copy game resource files
	cp -r $(@D)/Oxygen/sonic3air/data $(TARGET_DIR)/usr/bin/sonic3-air
	cp -r $(@D)/Oxygen/oxygenengine/data $(TARGET_DIR)/usr/bin/sonic3-air
	cp -r $(@D)/Oxygen/sonic3air/scripts $(TARGET_DIR)/usr/bin/sonic3-air
	cp -r $(@D)/Oxygen/sonic3air/saves $(TARGET_DIR)/usr/bin/sonic3-air
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
