################################################################################
#
# moonlight-embedded
#
################################################################################
# Version.: Commits on Aug 03, 2021
MOONLIGHT_EMBEDDED_VERSION = 469b2ed8668cee46dcd39c74e84d18c1f211cbc4
MOONLIGHT_EMBEDDED_SITE = https://github.com/moonlight-stream/moonlight-embedded.git
MOONLIGHT_EMBEDDED_SITE_METHOD = git
MOONLIGHT_EMBEDDED_GIT_SUBMODULES=y
MOONLIGHT_EMBEDDED_LICENSE = GPLv3
MOONLIGHT_EMBEDDED_DEPENDENCIES = opus expat libevdev avahi alsa-lib udev libcurl libcec ffmpeg sdl2 libenet

MOONLIGHT_EMBEDDED_CONF_OPTS = "-DCMAKE_INSTALL_SYSCONFDIR=/etc"

ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
	MOONLIGHT_EMBEDDED_DEPENDENCIES += rpi-userland
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ROCKCHIP_ANY),y)
	MOONLIGHT_EMBEDDED_DEPENDENCIES += rockchip-mpp librga
endif

define MOONLIGHT_EMBEDDED_INSTALL_SCRIPTS
        install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/moonlight-embedded/batocera-moonlight $(TARGET_DIR)/usr/bin/
endef

MOONLIGHT_EMBEDDED_POST_INSTALL_TARGET_HOOKS += MOONLIGHT_EMBEDDED_INSTALL_SCRIPTS

$(eval $(cmake-package))
