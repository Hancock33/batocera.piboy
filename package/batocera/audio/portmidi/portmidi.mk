################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Sept 07, 2025
PORTMIDI_VERSION = 7e978e1ef5bf199ad9ea43e3d224cd3f19cb2077
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
