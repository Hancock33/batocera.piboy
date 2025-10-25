################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Oct 25, 2025
PORTMIDI_VERSION = v2.0.7
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
