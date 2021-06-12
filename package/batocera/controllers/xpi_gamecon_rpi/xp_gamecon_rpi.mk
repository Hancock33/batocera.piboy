################################################################################
#
# XP_GAMECON_RPI
#
################################################################################
# Version.: Commits on May 30, 2021
XP_GAMECON_RPI_VERSION = 2bea492383af51cc945d2391ca3a41c7b05964c0
XP_GAMECON_RPI_SITE = $(call github,hancock33,piboycontrols,$(XP_GAMECON_RPI_VERSION))
XP_GAMECON_RPI_DEPENDENCIES = linux
XP_GAMECON_LINUX_VER = $(shell dirname $(TARGET_DIR)/lib/modules/*/build)

define XP_GAMECON_RPI_BUILD_CMDS
        $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR) KVERSION=$(XP_GAMECON_LINUX_VER)
endef

#define XP_GAMECON_RPI_INSTALL_TARGET_CMDS
#	$(MAKE) -C $(LINUX_DIR)/build M=$(@D) modules_install
#endef

$(eval $(kernel-module))
$(eval $(generic-package))
