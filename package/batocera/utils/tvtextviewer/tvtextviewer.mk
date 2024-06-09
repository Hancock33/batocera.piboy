################################################################################
#
# tvtextviewer
#
################################################################################
# Version: Commits on Nov 29, 2023
TVTEXTVIEWER_VERSION = d3cc00a5009ece2d1df6cfc571709d0c5752bade
TVTEXTVIEWER_SITE = https://github.com/lethal-guitar/TvTextViewer.git
TVTEXTVIEWER_SITE_METHOD=git
TVTEXTVIEWER_GIT_SUBMODULES=YES
TVTEXTVIEWER_DEPENDENCIES = sdl2
TVTEXTVIEWER_LICENSE = MIT

define TVTEXTVIEWER_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile
endef

define TVTEXTVIEWER_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/text_viewer $(TARGET_DIR)/usr/bin/text_viewer
	chmod 754 $(TARGET_DIR)/usr/bin/text_viewer
endef

$(eval $(generic-package))
