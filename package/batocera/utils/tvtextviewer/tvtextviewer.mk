################################################################################
#
# tvtextviewer
#
################################################################################
# Version: Commits on Aug 11, 2022
TVTEXTVIEWER_VERSION = a01d9c23db92b0757b3e9b1ff11e040337d945c3
TVTEXTVIEWER_SITE = https://github.com/lethal-guitar/TvTextViewer.git
TVTEXTVIEWER_SITE_METHOD=git
TVTEXTVIEWER_GIT_SUBMODULES=YES
TVTEXTVIEWER_DEPENDENCIES = sdl2 

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
