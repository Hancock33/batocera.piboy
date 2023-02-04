################################################################################
#
# eduke32
#
################################################################################
# Version: Commits on 17 Jan, 2023
EDUKE32_VERSION = 1a90b98832b7b3cc9ab6ec04e320dbf64744e9e3
EDUKE32_SITE = https://voidpoint.io/terminx/eduke32.git

EDUKE32_DEPENDENCIES = sdl2 flac libvpx
EDUKE32_SITE_METHOD=git
EDUKE32_LICENSE = GPL-2.0
EDUKE32_VC_REV="$(shell echo $(EDUKE32_SITE) | cut -c 1-7)"

# Some build options are documented here: https://wiki.eduke32.com/wiki/Building_EDuke32_on_Linux
EDUKE32_BUILD_ARGS = STARTUP_WINDOW=0
EDUKE32_BUILD_ARGS += HAVE_GTK2=0
EDUKE32_BUILD_ARGS += LTO=0
EDUKE32_BUILD_ARGS += PACKAGE_REPOSITORY=1
EDUKE32_BUILD_ARGS += VC_REV=$(EDUKE32_VC_REV)

define EDUKE32_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) $(EDUKE32_BUILD_ARGS) -C $(@D) duke3d
    $(MAKE) $(TARGET_CONFIGURE_OPTS) $(EDUKE32_BUILD_ARGS) -C $(@D) sw
    $(RM) -r $(@D)/obj
    $(MAKE) $(TARGET_CONFIGURE_OPTS) $(EDUKE32_BUILD_ARGS) FURY=1 -C $(@D)
endef

define EDUKE32_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/eduke32 $(TARGET_DIR)/usr/bin/eduke32
    $(INSTALL) -D -m 0755 $(@D)/voidsw  $(TARGET_DIR)/usr/bin/voidsw
    $(INSTALL) -D -m 0755 $(@D)/fury    $(TARGET_DIR)/usr/bin/ionfury
    #copy sdl game contoller info
    cp $(@D)/package/common/gamecontrollerdb.txt $(TARGET_DIR)/usr/share/gamecontrollerdb.txt
endef

$(eval $(generic-package))
