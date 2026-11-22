################################################################################
#
# batocera-userdatainit
#
################################################################################

BATOCERA_USERDATAINIT_VERSION = 1.0
BATOCERA_USERDATAINIT_LICENSE = GPL
BATOCERA_USERDATAINIT_SOURCE =

define BATOCERA_USERDATAINIT_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera
	rsync -a $(BATOCERA_USERDATAINIT_PKGDIR)/datainit/ $(TARGET_DIR)/usr/share/batocera/datainit/
endef

$(eval $(generic-package))
