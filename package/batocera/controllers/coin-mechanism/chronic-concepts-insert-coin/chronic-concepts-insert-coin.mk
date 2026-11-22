################################################################################
#
# chronic-concepts-insert-coin
#
################################################################################

CHRONIC_CONCEPTS_INSERT_COIN_VERSION = 1.0
CHRONIC_CONCEPTS_INSERT_COIN_SOURCE =
CHRONIC_CONCEPTS_INSERT_COIN_LICENSE = LGPL-3.0+

define CHRONIC_CONCEPTS_INSERT_COIN_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(CHRONIC_CONCEPTS_INSERT_COIN_PKGDIR)/99-Chronic_Concepts_Insert_Coin_Cube.rules $(TARGET_DIR)/etc/udev/rules.d/99-Chronic_Concepts_Insert_Coin_Cube.rules
	$(INSTALL) -D -m 0644 $(CHRONIC_CONCEPTS_INSERT_COIN_PKGDIR)/Chronic_Concepts_Insert_Coin_Cube_Gen_2-c2d2-2727.mapping $(TARGET_DIR)/usr/share/hotkeygen/Chronic_Concepts_Insert_Coin_Cube_Gen_2-c2d2-2727.mapping
	$(INSTALL) -D -m 0755 $(CHRONIC_CONCEPTS_INSERT_COIN_PKGDIR)/chronic-concepts-insert-coin.py $(TARGET_DIR)/usr/bin/chronic-concepts-insert-coin
endef

$(eval $(generic-package))
