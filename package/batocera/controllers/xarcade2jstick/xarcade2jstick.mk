################################################################################
#
# xarcade2jstick
#
################################################################################
# Version.: Commits on 05 Apr 2019
XARCADE2JSTICK_VERSION = d080123958dee9b2197e656e28c7859564a30893
XARCADE2JSTICK_SITE =  $(call github,petrockblog,xarcade2jstick,$(XARCADE2JSTICK_VERSION))
XARCADE2JSTICK_LICENSE = gpl3
XARCADE2JSTICK_DEPENDENCIES = linux


define XARCADE2JSTICK_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define XARCADE2JSTICK_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/src/xarcade2jstick $(TARGET_DIR)/usr/bin/xarcade2jstick

    # config
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/xarcade2jstick
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/xarcade2jstick/config/* \
		$(TARGET_DIR)/usr/share/batocera/datainit/system/configs/xarcade2jstick
endef

$(eval $(generic-package))
