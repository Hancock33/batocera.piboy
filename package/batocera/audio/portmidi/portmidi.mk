################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Jul 28, 2023
PORTMIDI_VERSION = 928520f7b79f371854387cb480b4e3b5bf5dac95
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = GPLv3
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
