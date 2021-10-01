################################################################################
#
# XPI_GAMECON_RPI
#
################################################################################
# Version.: Commits on May 30, 2021
XPI_GAMECON_RPI_VERSION = 2bea492383af51cc945d2391ca3a41c7b05964c0
XPI_GAMECON_RPI_SITE = $(call github,hancock33,piboycontrols,$(XPI_GAMECON_RPI_VERSION))
XPI_GAMECON_RPI_DEPENDENCIES = linux
XPI_GAMECON_LINUX_VER = $(shell dirname $(TARGET_DIR)/lib/modules/*/build)

define XPI_GAMECON_RPI_BUILD_CMDS
        $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR) KVERSION=$(XPI_GAMECON_LINUX_VER)
endef

define XPI_GAMECON_RPI_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/rpigpioswitch/S19piboy                              $(TARGET_DIR)/etc/init.d/S19piboy
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/rpigpioswitch/piboy_fan_ctrl.py                     $(TARGET_DIR)/usr/bin/piboy_fan_ctrl.py
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/rpigpioswitch/piboy_aud_ctrl.py                     $(TARGET_DIR)/usr/bin/piboy_aud_ctrl.py
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/rpigpioswitch/piboy_power_ctrl.py                   $(TARGET_DIR)/usr/bin/piboy_power_ctrl.py
endef

$(eval $(kernel-module))
$(eval $(generic-package))
