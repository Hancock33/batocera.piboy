################################################################################
#
# munt
#
################################################################################
# Version: Commits on Nov 08, 2026
MUNT_VERSION = libmt32emu_2_8_6
MUNT_SITE = $(call github,munt,munt,$(MUNT_VERSION))

MUNT_CONF_OPTS += -Dmunt_WITH_MT32EMU_QT=OFF
MUNT_CONF_OPTS += -Dmunt_WITH_MT32EMU_SMF2WAV=OFF

MUNT_INSTALL_STAGING = YES

$(eval $(cmake-package))
