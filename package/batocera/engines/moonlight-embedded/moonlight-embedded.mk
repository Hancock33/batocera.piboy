################################################################################
#
# moonlight-embedded
#
################################################################################
# Version: Commits on Oct 17, 2025
MOONLIGHT_EMBEDDED_VERSION = 74e552d50e03be45bada6d990f06fc9493b65716
MOONLIGHT_EMBEDDED_SITE = https://github.com/moonlight-stream/moonlight-embedded.git
MOONLIGHT_EMBEDDED_SITE_METHOD = git
MOONLIGHT_EMBEDDED_GIT_SUBMODULES=y
MOONLIGHT_EMBEDDED_LICENSE = GPLv3
MOONLIGHT_EMBEDDED_DEPENDENCIES = alsa-lib avahi enet expat ffmpeg libcec libcurl libevdev opus sdl2 udev

MOONLIGHT_EMBEDDED_CONF_OPTS = "-DCMAKE_INSTALL_SYSCONFDIR=/etc"

ifeq ($(BR2_PACKAGE_XORG7),y)
    MOONLIGHT_EMBEDDED_CONF_OPTS += -DENABLE_X11=ON
else
    MOONLIGHT_EMBEDDED_CONF_OPTS += -DENABLE_X11=OFF
endif

ifeq ($(BR2_PACKAGE_LIBVA),y)
    MOONLIGHT_EMBEDDED_DEPENDENCIES += libva-intel-driver intel-mediadriver
endif

ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
    MOONLIGHT_EMBEDDED_DEPENDENCIES += rpi-userland
endif

ifneq ($(BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4),y)
    ifeq ($(BR2_PACKAGE_ROCKCHIP_RGA)$(BR2_PACKAGE_ROCKCHIP_MPP),yy)
    MOONLIGHT_EMBEDDED_DEPENDENCIES += rockchip-mpp rockchip-rga ffmpeg-rockchip
    endif
endif

define MOONLIGHT_EMBEDDED_INSTALL_SCRIPTS
	mkdir -p $(TARGET_DIR)/usr/share/moonlight-embedded
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/engines/moonlight-embedded/moonlight.conf               $(TARGET_DIR)/usr/share/moonlight-embedded/
	install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/engines/moonlight-embedded/batocera-moonlight $(TARGET_DIR)/usr/bin/
endef

MOONLIGHT_EMBEDDED_POST_INSTALL_TARGET_HOOKS += MOONLIGHT_EMBEDDED_INSTALL_SCRIPTS

$(eval $(cmake-package))
