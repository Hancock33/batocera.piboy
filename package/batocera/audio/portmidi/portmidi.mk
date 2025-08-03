################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Aug 02, 2025
PORTMIDI_VERSION = 82675dabc8b1c9b1f552d55176357c661d9047c2
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
