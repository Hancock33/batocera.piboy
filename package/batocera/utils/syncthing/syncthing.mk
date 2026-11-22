################################################################################
#
# syncthing
#
################################################################################
# Version: Commits on Oct 21, 2026
SYNCTHING_VERSION = v2.1.7
SYNCTHING_SITE = $(call github,syncthing,syncthing,$(SYNCTHING_VERSION))
SYNCTHING_LICENSE = MPL-2.0
SYNCTHING_LICENSE_FILES = LICENSE

# GOFLAGS="-modcacherw" used to fix directory permissions to make sure cleanbuild works.
# For details see: https://github.com/golang/go/issues/27161 https://github.com/golang/go/issues/27455

SYNCTHING_TARGET_ENV = \
	GOROOT="$(HOST_GO_ROOT)" \
	GOPATH="$(HOST_GO_GOPATH)" \
	PATH=$(BR_PATH) \
	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
	GOMODCACHE="$(@D)" \
	GOFLAGS="-modcacherw"

define SYNCTHING_BUILD_CMDS
	cd $(@D) && $(SYNCTHING_TARGET_ENV) $(GO_BIN) run build.go -goos linux -goarch $(GO_GOARCH) -version $(SYNCTHING_VERSION) build
endef

define SYNCTHING_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/syncthing $(TARGET_DIR)/usr/bin/syncthing
	$(INSTALL) -D -m 0755 $(SYNCTHING_PKGDIR)/syncthing $(TARGET_DIR)/usr/share/batocera/services/syncthing
endef

$(eval $(golang-package))
