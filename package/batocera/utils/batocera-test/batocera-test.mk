################################################################################
#
# batocera-test
#
################################################################################

BATOCERA_TEST_VERSION = 1
BATOCERA_TEST_LICENSE = GPL
BATOCERA_TEST_SOURCE =
BATOCERA_TEST_DEPENDENCIES = python-requests

define BATOCERA_TEST_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BATOCERA_TEST_PKGDIR)/src/batocera-test $(TARGET_DIR)/usr/bin/batocera-test
endef

$(eval $(generic-package))
