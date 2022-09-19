################################################################################
#
# nblood
#
################################################################################
# Version: Commits on Sept 19, 2022
NBLOOD_VERSION = 7d9e893e4e069491b6b3d138306abbc04246d261
NBLOOD_SITE = https://github.com/nukeykt/NBlood.git

NBLOOD_DEPENDENCIES = sdl2 flac libvpx
NBLOOD_SITE_METHOD=git
NBLOOD_LICENSE = GPLv3

NBLOOD_BUILD_ARGS = STARTUP_WINDOW=0
NBLOOD_BUILD_ARGS += HAVE_GTK2=0
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    NBLOOD_BUILD_ARGS += USE_OPENGL=0
    NBLOOD_BUILD_ARGS += OPTOPT="-mcpu=cortex-a72 -mtune=cortex-a72 -ffast-math -w"
endif

define NBLOOD_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) blood
    $(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) rr
    $(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) exhumed
#   $(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) witchaven
#   $(MAKE) $(TARGET_CONFIGURE_OPTS) $(NBLOOD_BUILD_ARGS) -C $(@D) tekwar
endef

define NBLOOD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/nblood -D $(TARGET_DIR)/usr/bin/nblood
	$(INSTALL) -m 0755 $(@D)/pcexhumed -D $(TARGET_DIR)/usr/bin/pcexhumed
	$(INSTALL) -m 0755 $(@D)/rednukem -D $(TARGET_DIR)/usr/bin/rednukem
endef

$(eval $(generic-package))
