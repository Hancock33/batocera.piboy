################################################################################
#
# sonic3-air
#
################################################################################
# Version: Commits on Dec 23, 2025
SONIC3_AIR_VERSION = a61d86a9387b646be88f4f2f89c85d7b9183383b
SONIC3_AIR_SITE = $(call github,Eukaryot,sonic3air,$(SONIC3_AIR_VERSION))
SONIC3_AIR_LICENSE = GPL-3.0
SONIC3_AIR_LICENSE_FILE = COPYING.txt
# CMakeLists.txt in subfolder
SONIC3_AIR_SUBDIR = Oxygen/sonic3air/build/_cmake

SONIC3_AIR_DEPENDENCIES += alsa-lib libcurl libglu mesa3d pulseaudio
SONIC3_AIR_DEPENDENCIES += xlib_libXcomposite xlib_libXxf86vm

SONIC3_AIR_SUPPORTS_IN_SOURCE_BUILD = NO

SONIC3_AIR_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define SONIC3_AIR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/sonic3-air
	# copy binary
	cp $(@D)/Oxygen/sonic3air/sonic3air_linux $(TARGET_DIR)/usr/bin/sonic3-air
	# copy config files
	cp $(@D)/Oxygen/sonic3air/config.json $(TARGET_DIR)/usr/bin/sonic3-air
	cp $(@D)/Oxygen/sonic3air/oxygenproject.json $(TARGET_DIR)/usr/bin/sonic3-air
	# copy game resource files
	cp -r $(@D)/Oxygen/sonic3air/data $(TARGET_DIR)/usr/bin/sonic3-air
	cp -r $(@D)/Oxygen/sonic3air/scripts $(TARGET_DIR)/usr/bin/sonic3-air
	cp -r $(@D)/Oxygen/sonic3air/saves $(TARGET_DIR)/usr/bin/sonic3-air
endef

$(eval $(cmake-package))
