################################################################################
#
# WildMIDI
#
################################################################################
# Version.: Commits on Jul 25, 2021
WILDMIDI_VERSION = 0d942a04913bdfbbae10e60d59642e036e22f224
WILDMIDI_SITE =  $(call github,Mindwerks,wildmidi,$(WILDMIDI_VERSION))
WILDMIDI_LICENSE = LGPLv3
WILDMIDI_INSTALL_STAGING = YES

WILDMIDI_CONF_OPTS += -DBUILD_TESTING=OFF -DWANT_STATIC=ON -DWANT_PLAYER=OFF

$(eval $(cmake-package))
