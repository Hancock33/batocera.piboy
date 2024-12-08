################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Dec 03, 2024
PORTMIDI_VERSION = a941ae520e3b2a94da3c0cb517e1a2c40a3139ac
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
