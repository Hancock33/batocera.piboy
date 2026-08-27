################################################################################
#
# batocera-system
#
################################################################################

BATOCERA_SYSTEM_SOURCE=
BATOCERA_SYSTEM_ID_VERSION = $(shell date "+%y.%m")
BATOCERA_SYSTEM_RELEASE_TYPE = -dev
BATOCERA_SYSTEM_VERSION = $(BATOCERA_SYSTEM_ID_VERSION)$(BATOCERA_SYSTEM_RELEASE_TYPE)
BATOCERA_SYSTEM_DATE_TIME = $(shell date "+%d/%m/%Y %H:%M")
BATOCERA_SYSTEM_DATE = $(shell date "+%d/%m/%y")
BATOCERA_SYSTEM_DEPENDENCIES = tzdata
BATOCERA_SYSTEM_INSTALL_IMAGES = YES

ifneq (,$(findstring dev,$(BATOCERA_SYSTEM_RELEASE_TYPE)))
    BATOCERA_SYSTEM_BUILD_ID = "-$(shell cd $(BR2_EXTERNAL_BATOCERA_PATH) && git rev-parse --short HEAD)"
else
    BATOCERA_SYSTEM_BUILD_ID =
endif

define BATOCERA_SYSTEM_INSTALL_TARGET_CMDS
	# version/arch
	mkdir -p $(TARGET_DIR)/usr/share/batocera
	echo -n "$(BATOCERA_ARCH)" > $(TARGET_DIR)/usr/share/batocera/batocera.arch
	echo $(BATOCERA_SYSTEM_VERSION)$(BATOCERA_SYSTEM_BUILD_ID) $(BATOCERA_SYSTEM_DATE_TIME) > $(TARGET_DIR)/usr/share/batocera/batocera.version

	# datainit
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-system/batocera.conf $(TARGET_DIR)/usr/share/batocera/datainit/system

	# batocera-boot.conf
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-system/batocera-boot.conf $(BINARIES_DIR)/batocera-boot.conf

	# sysconfigs (default batocera.conf for boards)
	mkdir -p $(TARGET_DIR)/usr/share/batocera/sysconfigs
	if test -d $(BATOCERA_SYSTEM_PKGDIR)/sysconfigs/$(BATOCERA_ARCH); then \
		cp -pr $(BATOCERA_SYSTEM_PKGDIR)/sysconfigs/$(BATOCERA_ARCH)/* \
			$(TARGET_DIR)/usr/share/batocera/sysconfigs; \
	fi

	# mounts
	mkdir -p $(TARGET_DIR)/boot $(TARGET_DIR)/overlay $(TARGET_DIR)/userdata

	# variables
	mkdir -p $(TARGET_DIR)/etc/profile.d
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-system/xdg.sh $(TARGET_DIR)/etc/profile.d/xdg.sh
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-system/dbus.sh $(TARGET_DIR)/etc/profile.d/dbus.sh

	# list of modules that doesnt like suspend
	mkdir -p $(TARGET_DIR)/etc/pm/config.d
	echo 'SUSPEND_MODULES="rtw88_8822ce snd_pci_acp5x"' > $(TARGET_DIR)/etc/pm/config.d/config
endef

ifeq ($(BR2_PACKAGE_WAYLAND),y)
define BATOCERA_SYSTEM_INSTALL_WAYLAND
	cp $(BATOCERA_SYSTEM_PKGDIR)/wayland.sh $(TARGET_DIR)/etc/profile.d/wayland.sh
endef
BATOCERA_SYSTEM_POST_INSTALL_TARGET_HOOKS += BATOCERA_SYSTEM_INSTALL_WAYLAND
endif

define BATOCERA_SYSTEM_INSTALL_IMAGES_CMDS
	# batocera-boot.conf
	$(INSTALL) -D -m 0644 $(BATOCERA_SYSTEM_PKGDIR)/batocera-boot.conf $(BINARIES_DIR)/batocera-boot.conf
endef

define BATOCERA_SYSTEM_PYBOY_INSTALL
	install -m 0644 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-system/batocera-boot.piboy $(BINARIES_DIR)/batocera-boot.conf
endef

ifeq ($(BR2_PACKAGE_XPI_GAMECON_RPI),y)
    BATOCERA_SYSTEM_POST_INSTALL_TARGET_HOOKS += BATOCERA_SYSTEM_PYBOY_INSTALL
endif

$(eval $(generic-package))
