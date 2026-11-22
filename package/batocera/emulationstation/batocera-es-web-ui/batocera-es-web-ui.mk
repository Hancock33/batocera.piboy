################################################################################
#
# batocera-es-web-ui
#
################################################################################
# Version: Commits on Jun 22, 2025
BATOCERA_ES_WEB_UI_VERSION = 0.2
BATOCERA_ES_WEB_UI_LICENSE = LGPL
BATOCERA_ES_WEB_UI_DEPENDENCIES = batocera-emulationstation
BATOCERA_ES_WEB_UI_SOURCE =

define BATOCERA_ES_WEB_UI_RESOURCES
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/emulationstation/resources/services $(BATOCERA_ES_WEB_UI_PKGDIR)/web/*
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/batocera/services $(BATOCERA_ES_WEB_UI_PKGDIR)/services/*
endef

BATOCERA_ES_WEB_UI_POST_INSTALL_TARGET_HOOKS += BATOCERA_ES_WEB_UI_RESOURCES

$(eval $(generic-package))
