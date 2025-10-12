################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Oct 07, 2025
PORTMIDI_VERSION = 251b860ecfab9f0c6aa6a3744085190bb053f02c
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
