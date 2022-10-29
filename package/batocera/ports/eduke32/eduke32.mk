################################################################################
#
# eduke32
#
################################################################################
# Version: Commits on 21 Oct, 2022
EDUKE32_VERSION = a9c797dcb60d4dfa2e21aed09e498132e59282ba
EDUKE32_SITE = https://voidpoint.io/terminx/eduke32.git

EDUKE32_DEPENDENCIES = sdl2 flac libvpx
EDUKE32_SITE_METHOD=git
EDUKE32_LICENSE = GPL-2.0

# Some build options are documented here: https://wiki.eduke32.com/wiki/Building_EDuke32_on_Linux
EDUKE32_BUILD_ARGS = STARTUP_WINDOW=0
EDUKE32_BUILD_ARGS += HAVE_GTK2=0
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    EDUKE32_BUILD_ARGS += OPTOPT="-mcpu=cortex-a72 -mtune=cortex-a72 -ffast-math -w"
endif

define EDUKE32_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) $(EDUKE32_BUILD_ARGS) -C $(@D) duke3d
    $(MAKE) $(TARGET_CONFIGURE_OPTS) $(EDUKE32_BUILD_ARGS) -C $(@D) sw
endef

define EDUKE32_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/eduke32 $(TARGET_DIR)/usr/bin/eduke32
    $(INSTALL) -D -m 0755 $(@D)/voidsw -D $(TARGET_DIR)/usr/bin/voidsw
    #copy sdl game contoller info
    cp $(@D)/package/common/gamecontrollerdb.txt $(TARGET_DIR)/usr/share/gamecontrollerdb.txt
endef

$(eval $(generic-package))
