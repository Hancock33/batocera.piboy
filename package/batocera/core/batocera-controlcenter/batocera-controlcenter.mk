################################################################################
#
# batocera-controlcenter
#
################################################################################
# Version: Commits on Oct 30, 2026
BATOCERA_CONTROLCENTER_VERSION = 8fd3b8452915b470436565a00ca641e592bed385
BATOCERA_CONTROLCENTER_SITE = $(call github,lbrpdx,batocera-controlcenter,$(BATOCERA_CONTROLCENTER_VERSION))
BATOCERA_CONTROLCENTER_LICENSE = GPL-3.0
BATOCERA_CONTROLCENTER_INSTALL_STAGING = YES

BATOCERA_CONTROLCENTER_DEPENDENCIES = python3 python-evdev

define BATOCERA_CONTROLCENTER_BUILD_CMDS
	# update translation files
	$(HOST_DIR)/bin/python $(BATOCERA_CONTROLCENTER_PKGDIR)/getpot.py $(BATOCERA_CONTROLCENTER_PKGDIR)/controlcenter.xml $(BATOCERA_CONTROLCENTER_PKGDIR)/locales/controlcenter.pot
	$(BATOCERA_CONTROLCENTER_PKGDIR)/updatepo.sh update $(BATOCERA_CONTROLCENTER_PKGDIR)/locales
endef

define BATOCERA_CONTROLCENTER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 -t $(TARGET_DIR)/usr/share/batocera/controlcenter $(@D)/controlcenter.py $(@D)/ui_core.py $(@D)/xml_utils.py $(@D)/shell.py $(@D)/refresh.py $(@D)/gamepads.py $(@D)/DocViewer.py $(@D)/log.py
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/batocera/controlcenter $(@D)/style.css $(BATOCERA_CONTROLCENTER_PKGDIR)/images/bato-record.gif $(BATOCERA_CONTROLCENTER_PKGDIR)/controlcenter.xml
	$(INSTALL) -D -m 0755 $(BATOCERA_CONTROLCENTER_PKGDIR)/batocera-controlcenter-toogle.sh $(TARGET_DIR)/usr/bin/batocera-controlcenter
	$(INSTALL) -D -m 0755 $(BATOCERA_CONTROLCENTER_PKGDIR)/batocera-controlcenter-play-time.sh $(TARGET_DIR)/usr/bin/batocera-controlcenter-play-time
	$(INSTALL) -D -m 0644 $(BATOCERA_CONTROLCENTER_PKGDIR)/ra-icon.png $(TARGET_DIR)/usr/share/batocera/controlcenter/resources/ra-icon.png
	ln -sf ../share/batocera/controlcenter/controlcenter.py $(TARGET_DIR)/usr/bin/batocera-controlcenter-app
	# install translations
	$(BATOCERA_CONTROLCENTER_PKGDIR)/updatepo.sh build $(BATOCERA_CONTROLCENTER_PKGDIR)/locales $(TARGET_DIR)/usr/share/locale
endef

$(eval $(generic-package))
