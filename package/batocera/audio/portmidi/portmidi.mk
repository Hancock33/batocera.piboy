################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Feb 16, 2025
PORTMIDI_VERSION = 806aa16c7d3c85f6084e6b10299ce4a0da66edac
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
