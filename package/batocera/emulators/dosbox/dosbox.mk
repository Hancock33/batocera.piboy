################################################################################
#
# dosbox
#
################################################################################
# Version: Commits on Jan 12, 2020
DOSBOX_VERSION = e6b88ad03202d1f74e329f54f213d3b070bd6202
DOSBOX_SITE = $(call github,duganchen,dosbox,$(DOSBOX_VERSION))
DOSBOX_DEPENDENCIES = sdl2 sdl2_net fluidsynth zlib libpng libogg libvorbis
DOSBOX_LICENSE = GPLv2
DOSBOX_AUTORECONF = YES

DOSBOX_CONF_OPTS =	--enable-core-inline \
					--enable-dynrec \
					--enable-unaligned_memory \
					--prefix=/usr \
					--with-sdl-prefix="$(STAGING_DIR)/usr"

$(eval $(autotools-package))
