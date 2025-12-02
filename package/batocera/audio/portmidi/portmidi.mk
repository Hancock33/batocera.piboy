################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Dec 02, 2025
PORTMIDI_VERSION = v2.0.8
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
