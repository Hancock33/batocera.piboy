################################################################################
#
# clk
#
################################################################################
# Version: Commits on Sept 06, 2025
CLK_VERSION = 96fd0b78929577ed7e7da9cef11af16dff4a773d
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
