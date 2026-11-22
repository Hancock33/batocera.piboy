################################################################################
#
# munt
#
################################################################################
# Version: Commits on Nov 08, 2026
MUNT_VERSION = libmt32emu_2_8_6
MUNT_SITE = $(call github,munt,munt,$(MUNT_VERSION))
MUNT_LICENSE = LGPL-2.1+ (mt32emu), GPL-2.0+ (mt32emu_alsadrv)
MUNT_LICENSE_FILES = mt32emu/COPYING.LESSER.txt mt32emu_alsadrv/COPYING.txt

MUNT_CONF_OPTS += -Dmunt_WITH_MT32EMU_QT=OFF
MUNT_CONF_OPTS += -Dmunt_WITH_MT32EMU_SMF2WAV=OFF

MUNT_INSTALL_STAGING = YES

$(eval $(cmake-package))
