################################################################################
#
# clk
#
################################################################################
# Version: Commits on Jul 23, 2026
CLK_VERSION = 2026-07-23
CLK_SITE = https://github.com/TomHarte/CLK
CLK_LICENSE = MIT
CLK_DEPENDENCIES = sdl2 libgl
CLK_SITE_METHOD = git
CLK_EMULATOR_INFO = clk.emulator.yml

define CLK_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/clksignal $(TARGET_DIR)/usr/bin/clksignal
	# evmapy
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(CLK_PKGDIR)/clk.keys
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
