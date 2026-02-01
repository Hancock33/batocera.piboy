################################################################################
#
# ledspicer
#
################################################################################
# Version: Commits on Jan 30, 2026
LEDSPICER_VERSION = 0.7.3
LEDSPICER_SITE = $(call github,meduzapat,LEDSpicer,$(LEDSPICER_VERSION))
LEDSPICER_LICENSE = GPLv3
LEDSPICER_DEPENDENCIES = tinyxml2 libusb libtool udev libpthread-stubs

LEDSPICER_CONF_OPTS += -DENABLE_NANOLED=ON
LEDSPICER_CONF_OPTS += -DENABLE_PACDRIVE=ON
LEDSPICER_CONF_OPTS += -DENABLE_PACLED64=ON
LEDSPICER_CONF_OPTS += -DENABLE_ULTIMATEIO=ON
LEDSPICER_CONF_OPTS += -DENABLE_LEDWIZ32=ON
LEDSPICER_CONF_OPTS += -DENABLE_HOWLER=ON
LEDSPICER_CONF_OPTS += -DENABLE_ADALIGHT=ON
LEDSPICER_CONF_OPTS += -DPROJECT_CONF_DIR=/userdata/system/configs/ledspicer

ifeq ($(BR2_PACKAGE_PIGPIO),y)
    LEDSPICER_DEPENDENCIES += pigpio
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
LEDSPICER_CONF_OPTS += -DENABLE_PULSEAUDIO=ON
LEDSPICER_DEPENDENCIES += pulseaudio
else
LEDSPICER_CONF_OPTS += -DENABLE_PULSEAUDIO=OFF
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
LEDSPICER_CONF_OPTS += -DENABLE_ALSAAUDIO=ON
LEDSPICER_DEPENDENCIES += alsa-lib
else
LEDSPICER_CONF_OPTS += -DENABLE_ALSAAUDIO=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_RPI_ANY),y)
LEDSPICER_DEPENDENCIES += pigpio
LEDSPICER_CONF_OPTS += -DENABLE_RASPBERRYPI=ON
else
LEDSPICER_CONF_OPTS += -DENABLE_RASPBERRYPI=OFF
endif

define LEDSPICER_UDEV_RULE
	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
	cp $(@D)/data/21-ledspicer.rules $(TARGET_DIR)/etc/udev/rules.d/99-ledspicer.rules
endef

define LEDSPICER_SERVICE_INSTALL
	mkdir -p $(TARGET_DIR)/usr/share/batocera/services
	install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/ledspicer/ledspicer \
		$(TARGET_DIR)/usr/share/batocera/services/
endef

LEDSPICER_POST_INSTALL_TARGET_HOOKS += LEDSPICER_UDEV_RULE
LEDSPICER_POST_INSTALL_TARGET_HOOKS += LEDSPICER_SERVICE_INSTALL

$(eval $(cmake-package))
