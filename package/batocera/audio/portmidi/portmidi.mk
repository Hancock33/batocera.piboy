################################################################################
#
# portmidi
#
################################################################################
# Version: Commits on Jun 18, 2025
PORTMIDI_VERSION = 340c1c3d4af902253e78c699794eda4792b43976
PORTMIDI_SITE = $(call github,PortMidi,portmidi,$(PORTMIDI_VERSION))
PORTMIDI_LICENSE = MIT
PORTMIDI_SUPPORTS_IN_SOURCE_BUILD = NO
PORTMIDI_INSTALL_STAGING = YES
PORTMIDI_DEPENDENCIES = alsa-lib

$(eval $(cmake-package))
