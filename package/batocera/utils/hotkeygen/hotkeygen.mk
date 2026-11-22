################################################################################
#
# hotkeygen
#
################################################################################

HOTKEYGEN_LICENSE = GPL
HOTKEYGEN_SETUP_TYPE = hatch
HOTKEYGEN_DEPENDENCIES = \
	python-pyudev \
	python-evdev \
	python-batocera-common \
	python-dbus-fast \
	python-uvloop

define HOTKEYGEN_INSTALL_CONFIG_FILES
	$(INSTALL) -D -m 0755 $(@D)/resources/hotkeygen.service $(TARGET_DIR)/etc/init.d/S30hotkeygen
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/etc/hotkeygen \
		$(@D)/resources/config/default_context.conf \
		$(@D)/resources/config/common_context.conf \
		$(@D)/resources/config/default_mapping.conf
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/hotkeygen $(@D)/resources/config/specific/*.mapping
	$(INSTALL) -D -m 0644 $(@D)/resources/dbus/hotkeygen.conf  $(TARGET_DIR)/usr/share/dbus-1/system.d/hotkeygen.conf
endef

HOTKEYGEN_POST_INSTALL_TARGET_HOOKS += HOTKEYGEN_INSTALL_CONFIG_FILES

define HOTKEYGEN_INSTALL_SM8250_CONFIG
	$(INSTALL) -m 0644 $(@D)/resources/config/default_mapping-sm8250.conf $(TARGET_DIR)/etc/hotkeygen/default_mapping.conf
endef

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_SM8250),y)
HOTKEYGEN_POST_INSTALL_TARGET_HOOKS += HOTKEYGEN_INSTALL_SM8250_CONFIG
endif

$(eval $(local-python-package))
