################################################################################
#
# batocera-launch
#
################################################################################

BATOCERA_LAUNCH_SETUP_TYPE=hatch
BATOCERA_LAUNCH_DEPENDENCIES = \
	python-batocera-common \
	python-uvloop \
	python-evdev \
	python-pyudev \
	python-toml \
	python-pillow \
	python-qrcode \
	python-configobj \
	batocera-bezel-overlay \
	hotkeygen
BATOCERA_LAUNCH_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
BATOCERA_LAUNCH_ARCH = x86_64
else
BATOCERA_LAUNCH_ARCH = $(BATOCERA_ARCH)
endif

define BATOCERA_LAUNCH_INSTALL_TARGET_DEFAULT_OPTIONS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/launch/defaults
	$(INSTALL) -D -m 0644 $(@D)/resources/defaults/config.yml \
	    $(TARGET_DIR)/usr/share/batocera/launch/defaults/config.yml

	if test -e $(@D)/resources/defaults/config-$(BATOCERA_LAUNCH_ARCH).yml; then \
		$(INSTALL) -D -m 0644 $(@D)/resources/defaults/config-$(BATOCERA_LAUNCH_ARCH).yml \
		    $(TARGET_DIR)/usr/share/batocera/launch/defaults/config-arch.yml; \
	fi
endef

define BATOCERA_LAUNCH_INSTALL_STAGING_DEFAULT_OPTIONS
	mkdir -p $(STAGING_DIR)/usr/share/batocera/launch
	$(INSTALL) -D -m 0644 $(@D)/resources/defaults/config.yml \
	    $(STAGING_DIR)/usr/share/batocera/launch/defaults/config.yml

	if test -e $(@D)/resources/defaults/config-$(BATOCERA_LAUNCH_ARCH).yml; then \
		$(INSTALL) -D -m 0644 $(@D)/resources/defaults/config-$(BATOCERA_LAUNCH_ARCH).yml \
		    $(STAGING_DIR)/usr/share/batocera/launch/defaults/config-arch.yml; \
	fi
endef

define BATOCERA_LAUNCH_INSTALL_RESOURCES
	mkdir -p $(TARGET_DIR)/usr/share/evmapy

	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/batocera/launch/data \
		$(@D)/resources/data/gamesbuttonsdb.xml

	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/batocera/launch/data/special \
		$(@D)/resources/data/special/*.toml

	# evmapy default hotkeys file
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/evmapy \
		$(@D)/resources/hotkeys.keys
endef

BATOCERA_LAUNCH_POST_INSTALL_TARGET_HOOKS += BATOCERA_LAUNCH_INSTALL_TARGET_DEFAULT_OPTIONS
BATOCERA_LAUNCH_POST_INSTALL_TARGET_HOOKS += BATOCERA_LAUNCH_INSTALL_RESOURCES

BATOCERA_LAUNCH_POST_INSTALL_STAGING_HOOKS += BATOCERA_LAUNCH_INSTALL_STAGING_DEFAULT_OPTIONS

define BATOCERA_LAUNCH_INSTALL_PYBOY
	cp $(@D)/resources/defaults/config-piboy4.yml  $(TARGET_DIR)/usr/share/batocera/launch/defaults/config-arch.yml
endef

ifeq ($(BR2_PACKAGE_XPI_GAMECON_RPI),y)
    BATOCERA_LAUNCH_POST_INSTALL_TARGET_HOOKS += BATOCERA_LAUNCH_INSTALL_PYBOY
endif

$(eval $(local-python-package))
