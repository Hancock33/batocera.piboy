################################################################################
#
# ikemen
#
################################################################################
# Version: Commits on Sept 06, 2025
IKEMEN_VERSION = 7e79356ef75c404616a9837e0c1103208b8ddef6
IKEMEN_SITE = $(call github,ikemen-engine,Ikemen-GO,$(IKEMEN_VERSION))
IKEMEN_LICENSE = MIT
IKEMEN_DEPENDENCIES = libgtk3 mesa3d openal libglfw

HOST_GO_COMMON_ENV = GOFLAGS=-mod=mod \
			 GO111MODULE=on \
			 GOROOT="$(HOST_GO_ROOT)" \
			 GOPATH="$(HOST_GO_GOPATH)" \
			 GOCACHE="$(HOST_GO_TARGET_CACHE)" \
			 GOMODCACHE="$(@D)" \
			 GOFLAGS="-modcacherw" \
			 PATH=$(BR_PATH) \
			 GOBIN= \
			 CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
			 GOEXPERIMENT=arenas

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
