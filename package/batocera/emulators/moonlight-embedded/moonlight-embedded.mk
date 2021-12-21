################################################################################
#
# moonlight-embedded
#
################################################################################
# Version.: Commits on Dec 20, 2021
MOONLIGHT_EMBEDDED_VERSION = 807565de8ba68218ca15ceaf2fc646b2ebf544b1
MOONLIGHT_EMBEDDED_SITE = https://github.com/moonlight-stream/moonlight-embedded.git
MOONLIGHT_EMBEDDED_SITE_METHOD = git
MOONLIGHT_EMBEDDED_GIT_SUBMODULES=y
MOONLIGHT_EMBEDDED_LICENSE = GPLv3
MOONLIGHT_EMBEDDED_DEPENDENCIES = opus expat libevdev avahi alsa-lib udev libcurl libcec ffmpeg sdl2 libenet

MOONLIGHT_EMBEDDED_CONF_OPTS = "-DCMAKE_INSTALL_SYSCONFDIR=/etc"

ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
	MOONLIGHT_EMBEDDED_DEPENDENCIES += rpi-userland
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3326),y)
	MOONLIGHT_EMBEDDED_DEPENDENCIES += rockchip-mpp rockchip-rga
endif

define MOONLIGHT_EMBEDDED_INSTALL_SCRIPTS
        install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/moonlight-embedded/batocera-moonlight $(TARGET_DIR)/usr/bin/
endef

MOONLIGHT_EMBEDDED_POST_INSTALL_TARGET_HOOKS += MOONLIGHT_EMBEDDED_INSTALL_SCRIPTS

$(eval $(cmake-package))
