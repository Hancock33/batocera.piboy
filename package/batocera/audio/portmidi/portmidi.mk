################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Oct 25, 2025
PORTMIDI_VERSION = 8341a6713842d2374c3aad8998d43b20ad0db435
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
