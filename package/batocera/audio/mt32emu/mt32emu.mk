################################################################################
#
# mt32emu
#
################################################################################
# Version: Commits on Apr 03, 2025
MT32EMU_VERSION = libmt32emu_2_7_2
MT32EMU_SITE = $(call github,munt,munt,$(MT32EMU_VERSION))

MT32EMU_CONF_OPTS += -Dmunt_WITH_MT32EMU_QT=OFF
MT32EMU_CONF_OPTS += -Dmunt_WITH_MT32EMU_SMF2WAV=OFF

MT32EMU_INSTALL_STAGING = YES

$(eval $(cmake-package))
