################################################################################
#
# XPI_GAMECON_RPI
#
################################################################################
# Commits on May 22, 20212020
XPI_GAMECON_RPI_VERSION = 295e715561d2801c7b77e2ffedeabff88b05eedc
XPI_GAMECON_RPI_SITE = $(call github,hancock33,piboycontrols,$(XPI_GAMECON_RPI_VERSION))
XPI_GAMECON_RPI_DEPENDENCIES = linux
XPI_GAMECON_LINUX_VER = $(shell dirname $(TARGET_DIR)/lib/modules/*/build)

define XPI_GAMECON_RPI_BUILD_CMDS
        $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR) KVERSION=$(XPI_GAMECON_LINUX_VER)
endef

#define XPI_GAMECON_RPI_INSTALL_TARGET_CMDS
#	$(MAKE) -C $(LINUX_DIR)/build M=$(@D) modules_install
#endef

$(eval $(kernel-module))
$(eval $(generic-package))
