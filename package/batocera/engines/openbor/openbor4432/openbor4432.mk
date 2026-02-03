################################################################################
#
# openbor4432
#
################################################################################
# Version: Commits on Jan 14, 2021
OPENBOR4432_VERSION = 49505541b858d59842e87e75f415dfb4322ead93
OPENBOR4432_SITE = $(call github,Darknior,OpenBORv3b4432,$(OPENBOR4432_VERSION))
OPENBOR4432_LICENSE = BSD
OPENBOR4432_DEPENDENCIES = openbor-common libvpx sdl2 libpng libogg libvorbis sdl2_gfx host-yasm
OPENBOR4432_EMULATOR_INFO = openbor4432.openbor.core.yml

OPENBOR4432_EXTRAOPTS=""

ifeq ($(BR2_x86_64),y)
    OPENBOR4432_EXTRAOPTS=BUILD_LINUX=1 BUILD_PLATFORM=x86_64 BUILD_VERBOSE=1
endif
ifeq ($(BR2_riscv),y)
    OPENBOR4432_EXTRAOPTS=BUILD_LINUX=1 BUILD_PLATFORM=x86_64
endif
ifeq ($(BR2_x86_i686),y)
    OPENBOR4432_EXTRAOPTS=BUILD_LINUX=1
endif
ifeq ($(BR2_arm)$(BR2_aarch64),y)
    OPENBOR4432_EXTRAOPTS=BUILD_ARM=1
endif

define OPENBOR4432_BUILD_CMDS
	$(SED) "s|-O0|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	cd $(@D) && bash $(@D)/version.sh
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile $(OPENBOR4432_EXTRAOPTS)
endef

define OPENBOR4432_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/OpenBOR $(TARGET_DIR)/usr/bin/OpenBOR4432
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
