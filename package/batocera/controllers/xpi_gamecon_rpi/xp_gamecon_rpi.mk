################################################################################
#
# XPI_GAMECON_RPI
#
################################################################################
# Commits on 13 Dec 2020
XPI_GAMECON_RPI_VERSION = cc96ca5777c2a17b9b44c1bbc15f37cfbcdd465f
XPI_GAMECON_RPI_SITE = $(call github,losernator,PiBoyControls,$(XPI_GAMECON_RPI_VERSION))
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