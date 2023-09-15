################################################################################
#
# openbor7142
#
################################################################################
# Version: Commits on Apr 22, 2022
OPENBOR7142_VERSION = 7f6f17507078848be625e6d1c1b4f41823151387
OPENBOR7142_SITE = $(call github,DCurrent,openbor,$(OPENBOR7142_VERSION))
OPENBOR7142_LICENSE = BSD

OPENBOR7142_DEPENDENCIES = libvpx sdl2 libpng libogg libvorbis host-yasm sdl2_gfx
OPENBOR7142_EXTRAOPTS=""

ifeq ($(BR2_x86_64),y)
	OPENBOR7142_EXTRAOPTS=BUILD_LINUX=1 BUILD_PLATFORM=x86_64
endif
ifeq ($(BR2_riscv),y)
	OPENBOR7142_EXTRAOPTS=BUILD_LINUX=1 BUILD_PLATFORM=x86_64
endif
ifeq ($(BR2_x86_i686),y)
	OPENBOR7142_EXTRAOPTS=BUILD_LINUX=1
endif
ifeq ($(BR2_arm)$(BR2_aarch64),y)
	OPENBOR7142_EXTRAOPTS=BUILD_ARM=1
endif

define OPENBOR7142_BUILD_CMDS
	$(SED) "s|-O0|$(TARGET_OPTIMIZATION)|g" $(@D)/engine/Makefile
	cd $(@D)/engine && $(@D)/engine/version.sh
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/engine -f Makefile $(OPENBOR7142_EXTRAOPTS)
endef

define OPENBOR7142_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/engine/OpenBOR $(TARGET_DIR)/usr/bin/OpenBOR7142
endef

$(eval $(generic-package))