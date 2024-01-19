################################################################################
#
# nblood
#
################################################################################
# Version: Commits on Jan 19, 2024
NBLOOD_VERSION = fa3abd48b59f99c38f02c0c0917a84eec7bb58ab
NBLOOD_SITE = https://github.com/nukeykt/NBlood.git

NBLOOD_DEPENDENCIES = sdl2 flac libvpx
NBLOOD_SITE_METHOD=git
NBLOOD_LICENSE = GPLv3
NBLOOD_VC_REV="$(shell echo $(NBLOOD_VERSION) | cut -c 1-7)"

NBLOOD_BUILD_ARGS = STARTUP_WINDOW=0
NBLOOD_BUILD_ARGS += HAVE_GTK2=0
NBLOOD_BUILD_ARGS += LTO=0
NBLOOD_BUILD_ARGS += PACKAGE_REPOSITORY=1
NBLOOD_BUILD_ARGS += VC_REV=$(NBLOOD_VC_REV)
NBLOOD_BUILD_ARGS += OPTLEVEL=s
NBLOOD_BUILD_ARGS += OPTOPT="$(TARGET_OPTIMIZATION)"

define NBLOOD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) blood
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) rr
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) exhumed
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) sw
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) witchaven
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) tekwar
endef

define NBLOOD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/nblood	  $(TARGET_DIR)/usr/bin/nblood
	$(INSTALL) -m 0755 $(@D)/pcexhumed   $(TARGET_DIR)/usr/bin/pcexhumed
	$(INSTALL) -m 0755 $(@D)/rednukem	$(TARGET_DIR)/usr/bin/rednukem
	#$(INSTALL) -m 0755 $(@D)/voidsw	  $(TARGET_DIR)/usr/bin/voidsw
	#$(INSTALL) -m 0755 $(@D)/ewitchaven  $(TARGET_DIR)/usr/bin/witchaven
	#$(INSTALL) -m 0755 $(@D)/etekwar	 $(TARGET_DIR)/usr/bin/tekwar
endef

$(eval $(generic-package))
