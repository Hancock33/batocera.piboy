################################################################################
#
# guncon
#
################################################################################
# Version: Commits on Jun 03, 2023
GUNCON_VERSION = a64185319a543bcab0fe6f5b1f8c2dab03e7cea5
GUNCON_SITE = $(call github,Redemp,guncon2,$(GUNCON_VERSION))

define GUNCON_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0644 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/guncon/99-guncon.rules $(TARGET_DIR)/etc/udev/rules.d/99-guncon.rules
    $(INSTALL) -m 0755 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/guncon/guncon-add      $(TARGET_DIR)/usr/bin/guncon-add
    $(INSTALL) -D -m 0755 $(@D)/guncon2_calibrate.sh $(TARGET_DIR)/usr/bin/guncon2_calibrate.sh
    $(INSTALL) -D -m 0755 $(@D)/calibrate.py $(TARGET_DIR)/usr/bin/calibrate.py
endef


$(eval $(kernel-module))
$(eval $(generic-package))
