################################################################################
#
# ryujinx
#
################################################################################
# Version: Commits on Sept 18, 2026
RYUJINX_VERSION = 280c427c550c5fe3bcc46b378e06a9b90a7e6b09
RYUJINX_SITE = https://git.ryujinx.app/projects/Kenji-NX.git
RYUJINX_LICENSE = MIT
RYUJINX_DEPENDENCIES = adwaita-icon-theme hicolor-icon-theme librsvg openal sdl3
RYUJINX_EMULATOR_INFO = ryujinx.emulator.yml

define RYUJINX_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/ryujinx
	mkdir -p $(TARGET_DIR)/usr/bin/ryujinx
	tar -xf $(DL_DIR)/ryujinx/ryujinx-$(RYUJINX_VERSION).tar.gz -C $(TARGET_DIR)/usr/bin/ryujinx
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
