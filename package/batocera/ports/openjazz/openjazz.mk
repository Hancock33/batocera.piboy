################################################################################
#
# openjazz
#
################################################################################
# Version: Commits on Oct 25, 2023
OPENJAZZ_VERSION = 8bcd826faba1a07ca567ebcd3d0ffadf055e3398
OPENJAZZ_SITE =  $(call github,AlisterT,openjazz,$(OPENJAZZ_VERSION))

OPENJAZZ_DEPENDENCIES = sdl2
OPENJAZZ_LICENSE = GPLv2

define OPENJAZZ_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
	CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
	-C $(@D) -f Makefile
endef

define OPENJAZZ_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/OpenJazz $(TARGET_DIR)/usr/bin/OpenJazz
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openjazz/openjazz.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
