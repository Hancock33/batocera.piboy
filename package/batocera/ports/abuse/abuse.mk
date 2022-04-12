################################################################################
#
# Abuse
#
################################################################################
# Version: Commits on Nov 14, 2021
ABUSE_VERSION = c6b1954397df48b6e0ad4f8eb21947bc061335c7
ABUSE_SITE = $(call github,jjsimpso,abuse-sdl2,$(ABUSE_VERSION))

ABUSE_DEPENDENCIES = sdl2 sdl2_mixer abuse-data
ABUSE_LIBTOOL_PATCH = NO
ABUSE_SUPPORTS_IN_SOURCE_BUILD = NO
ABUSE_CONF_OPTS += --with-x --enable-debug --disable-shared

define ABUSE_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
		PREFIX=/usr \
		STRIP=/bin/true \
		DESTDIR=$(TARGET_DIR) \
		install
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/abuse/abuse.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(autotools-package))
