################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Mar 26, 2024
PORTMIDI_VERSION = 3920301ce1234031007550cd0b99b4d6649e3283
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
