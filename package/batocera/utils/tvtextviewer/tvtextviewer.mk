################################################################################
#
# tvtextviewer
#
################################################################################
# Version: Commits on Jun 28, 2026
TVTEXTVIEWER_VERSION = 2e961201e2d5fa73be8b5f82977038f3fd22dbba
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
