################################################################################
#
# ionfury
#
################################################################################
# Version: Commits on 26 Jul, 2022
IONFURY_VERSION = 9ae924b98be227dd2c3993268a40af1a61055f7e
IONFURY_SITE = https://voidpoint.io/terminx/eduke32.git

IONFURY_DEPENDENCIES = sdl2 flac libvpx
IONFURY_SITE_METHOD=git
IONFURY_LICENSE = GPL-2.0

# Some build options are documented here: https://wiki.eduke32.com/wiki/Building_EDuke32_on_Linux
IONFURY_BUILD_ARGS = STARTUP_WINDOW=0
IONFURY_BUILD_ARGS += HAVE_GTK2=0
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    IONFURY_BUILD_ARGS += USE_OPENGL=0 LTO=0
    IONFURY_BUILD_ARGS += OPTOPT="-mcpu=cortex-a72 -mtune=cortex-a72 -ffast-math -w"
endif

define IONFURY_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) $(IONFURY_BUILD_ARGS) FURY=1 -C $(@D)
endef

define IONFURY_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/fury $(TARGET_DIR)/usr/bin/ionfury
endef

$(eval $(generic-package))
