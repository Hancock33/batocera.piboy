################################################################################
#
# nblood
#
################################################################################
# Version: Commits on Aug 14, 2025
NBLOOD_VERSION = r14259
NBLOOD_SITE = $(call github,NBlood,NBlood,$(NBLOOD_VERSION))
NBLOOD_DEPENDENCIES = sdl2 flac libvpx
NBLOOD_LICENSE = GPLv3
NBLOOD_VC_REV="$(shell echo $(NBLOOD_VERSION) | cut -c 1-7)"

NBLOOD_BUILD_ARGS += HAVE_GTK2=0
NBLOOD_BUILD_ARGS += LF=""
NBLOOD_BUILD_ARGS += LTO=0
NBLOOD_BUILD_ARGS += OPTLEVEL=3
NBLOOD_BUILD_ARGS += OPTOPT="$(TARGET_OPTIMIZATION)"
NBLOOD_BUILD_ARGS += PACKAGE_REPOSITORY=1
NBLOOD_BUILD_ARGS += VC_REV=$(NBLOOD_VC_REV)
NBLOOD_BUILD_ARGS += STARTUP_WINDOW=0

define NBLOOD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS)  $(NBLOOD_BUILD_ARGS) -C $(@D) blood
	$(MAKE) $(TARGET_CONFIGURE_OPTS)  $(NBLOOD_BUILD_ARGS) -C $(@D) exhumed
	$(MAKE) $(TARGET_CONFIGURE_OPTS)  $(NBLOOD_BUILD_ARGS) -C $(@D) rr
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) sw
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) tekwar
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) witchaven
endef

define NBLOOD_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/nblood/pcexhumed.keys $(TARGET_DIR)/usr/share/evmapy/pcexhumed.keys

	$(INSTALL) -m 0755 $(@D)/nblood      $(TARGET_DIR)/usr/bin/nblood
	$(INSTALL) -m 0755 $(@D)/pcexhumed   $(TARGET_DIR)/usr/bin/pcexhumed
	$(INSTALL) -m 0755 $(@D)/rednukem    $(TARGET_DIR)/usr/bin/rednukem
	#$(INSTALL) -m 0755 $(@D)/voidsw     $(TARGET_DIR)/usr/bin/voidsw
	#$(INSTALL) -m 0755 $(@D)/etekwar    $(TARGET_DIR)/usr/bin/tekwar
	#$(INSTALL) -m 0755 $(@D)/ewitchaven $(TARGET_DIR)/usr/bin/witchaven
endef

$(eval $(generic-package))
