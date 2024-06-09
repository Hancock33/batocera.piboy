################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on May 04, 2024
PORTMIDI_VERSION = 912aba2f85f4119b6f3a420a80621397ebddfff6
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
