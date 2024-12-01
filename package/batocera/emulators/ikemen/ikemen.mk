################################################################################
#
# ikemen
#
################################################################################
# Version: Commits on Nov 30, 2024
IKEMEN_VERSION = 8c91ef9ef8fb5e5d9fc20d2b5d014cfcf9af7d9a
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
			 CGO_ENABLED=$(HOST_GO_CGO_ENABLED)

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
