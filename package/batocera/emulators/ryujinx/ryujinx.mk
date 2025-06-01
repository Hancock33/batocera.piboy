################################################################################
#
# ryujinx
#
################################################################################
# Version: Commits on May 29, 2025
RYUJINX_VERSION = 1.3.58
RYUJINX_SOURCE = ryujinx-canary-$(RYUJINX_VERSION)-linux_x64.tar.gz
RYUJINX_SITE = https://github.com/Ryubing/Canary-Releases/releases/download/$(RYUJINX_VERSION)
RYUJINX_LICENSE = MIT
RYUJINX_DEPENDENCIES = adwaita-icon-theme hicolor-icon-theme librsvg openal sdl2

define RYUJINX_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && tar xf $(DL_DIR)/$(RYUJINX_DL_SUBDIR)/$(RYUJINX_SOURCE)
endef

define RYUJINX_INSTALL_TARGET_CMDS
	rm -rf   $(TARGET_DIR)/usr/bin/ryujinx
	mkdir -p $(TARGET_DIR)/usr/bin/ryujinx
	cp -pr $(@D)/target/publish/* $(TARGET_DIR)/usr/bin/ryujinx
endef

$(eval $(generic-package))
