################################################################################
#
# clk
#
################################################################################
# Version: Commits on Sept 05, 2025
CLK_VERSION = 26f82e8143b359d6425a89c78c1b313726f822c3
CLK_SITE = https://github.com/TomHarte/CLK
CLK_LICENSE = MIT
CLK_DEPENDENCIES = sdl2 libgl
CLK_SITE_METHOD = git

CLK_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define CLK_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/clksignal $(TARGET_DIR)/usr/bin/
	# evmapy
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/clk/clk.keys \
	    $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
