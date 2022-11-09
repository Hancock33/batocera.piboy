################################################################################
#
# ikemen
#
################################################################################
# Version: Commits on Nov 08, 2022
IKEMEN_VERSION = 8d07796f0e65c515fd317f6f7c1eb481a040f760
IKEMEN_SITE = https://github.com/ikemen-engine/Ikemen-GO
IKEMEN_LICENSE = MIT
IKEMEN_DEPENDENCIES = libgtk3 mesa3d openal libglfw

IKEMEN_SITE_METHOD = git
IKEMEN_GIT_SUBMODULES = YES

define IKEMEN_BUILD_CMDS
	$(HOST_GO_TARGET_ENV) $(MAKE) -C $(@D) -f Makefile Ikemen_GO_Linux
endef

define IKEMEN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	$(INSTALL) -D $(@D)/bin/Ikemen_GO_Linux $(TARGET_DIR)/usr/bin/ikemen
	# evmapy
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/ikemen/ikemen.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(golang-package))
