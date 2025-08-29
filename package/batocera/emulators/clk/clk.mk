################################################################################
#
# clk
#
################################################################################
# Version: Commits on Aug 27, 2025
CLK_VERSION = eeb06de916c23e48d425a6a772aebf897e94bae9
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
