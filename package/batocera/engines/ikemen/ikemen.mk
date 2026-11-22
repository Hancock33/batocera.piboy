################################################################################
#
# ikemen
#
################################################################################
# Version: Commits on Sept 11, 2026
IKEMEN_VERSION = v1.0.0
IKEMEN_SITE = $(call github,ikemen-engine,Ikemen-GO,$(IKEMEN_VERSION))
IKEMEN_LICENSE = MIT
IKEMEN_DEPENDENCIES = libgtk3 mesa3d openal libglfw libxmp
IKEMEN_EMULATOR_INFO = ikemen.emulator.yml

# ikemen's own Go settings, applied on top of Buildroot's target Go env
IKEMEN_GO_ENV = \
	GOMODCACHE="$(@D)" \
	GOFLAGS="-modcacherw" \
	CGO_ENABLED=0 \
	GOEXPERIMENT=arenas \
	BUILD_FFMPEG=no
define IKEMEN_BUILD_CMDS
	$(HOST_GO_TARGET_ENV) $(IKEMEN_GO_ENV) $(MAKE) -C $(@D) -f Makefile Ikemen_GO_Linux
endef

define IKEMEN_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/Ikemen_GO_Linux $(TARGET_DIR)/usr/bin/ikemen
	# evmapy
	$(INSTALL) -D -m 0644 $(IKEMEN_PKGDIR)/ikemen.keys $(TARGET_DIR)/usr/share/evmapy/ikemen.keys
endef

$(eval $(golang-package))
$(eval $(emulator-info-package))
