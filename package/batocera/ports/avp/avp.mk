################################################################################
#
# avp
#
################################################################################
# Version: Commits on Nov 09, 2026
AVP_VERSION = 3492a6823b5889c29bd769ba45d82008d6593a18
AVP_SITE = $(call github,atsb,NakedAVP,$(AVP_VERSION))
AVP_EMULATOR_INFO = avp.emulator.yml
AVP_DEPENDENCIES = sdl3 sdl3_mixer
AVP_LICENSE = GPL-2.0
AVP_SUPPORTS_IN_SOURCE_BUILD = NO

AVP_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -Wno-implicit-function-declaration"
AVP_CONF_OPTS += -DOPENGL_TYPE=AUTO

define AVP_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0754 -D $(@D)/buildroot-build/avp $(TARGET_DIR)/usr/bin/avp
	# evmap config
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(AVP_PKGDIR)/avp.keys
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
