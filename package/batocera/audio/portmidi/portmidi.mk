################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Aug 13, 2024
PORTMIDI_VERSION = 7a5de5b7597c46f963d72a83defe7592f901e5f1
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
