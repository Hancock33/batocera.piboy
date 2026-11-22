################################################################################
#
# batocera-backglass
#
################################################################################

BATOCERA_BACKGLASS_VERSION = 1.0
BATOCERA_BACKGLASS_LICENSE = GPL
BATOCERA_BACKGLASS_SOURCE =

BATOCERA_BACKGLASS_DEPENDENCIES = sdl2 sdl2_image sdl2_ttf libcurl openssl dejavu noto-cjk-fonts

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
BATOCERA_BACKGLASS_CXXFLAGS = -DHAVE_XORG=1
else
BATOCERA_BACKGLASS_CXXFLAGS = -DHAVE_XORG=0
endif

define BATOCERA_BACKGLASS_BUILD_CMDS
	$(TARGET_CXX) $(TARGET_CXXFLAGS) $(TARGET_LDFLAGS) \
		-o $(@D)/batocera-backglass-window \
		$(BATOCERA_BACKGLASS_CXXFLAGS) \
		$(BATOCERA_BACKGLASS_PKGDIR)/batocera-backglass-window.cpp \
		-lSDL2 -lSDL2_image -lSDL2_ttf -lcurl -lcrypto -lpthread
endef

define BATOCERA_BACKGLASS_INSTALL_TARGET_CMDS
	# Install main bash controls script
	$(INSTALL) -D -m 0755 $(BATOCERA_BACKGLASS_PKGDIR)/batocera-backglass.sh $(TARGET_DIR)/usr/bin/batocera-backglass

	# Install the compiled native backglass execution window binary
	$(INSTALL) -D -m 0755 $(@D)/batocera-backglass-window $(TARGET_DIR)/usr/bin/batocera-backglass-window

	# Install hook wrappers
	$(INSTALL) -D -m 0755 -t $(TARGET_DIR)/usr/share/batocera-backglass/scripts $(BATOCERA_BACKGLASS_PKGDIR)/scripts/*.sh
endef

$(eval $(generic-package))
