################################################################################
#
# vdpauinfo
#
################################################################################
# Version: Commits on Jun 23, 2022
VDPAUINFO_VERSION = 1.5
VDPAUINFO_SITE = https://gitlab.freedesktop.org/vdpau/vdpauinfo/-/archive/$(VDPAUINFO_VERSION)
VDPAUINFO_LICENSE = MIT
VDPAUINFO_LICENSE_FILES = COPYING

VDPAUINFO_DEPENDENCIES = libvdpau xlib_libX11
VDPAUINFO_AUTORECONF = YES

$(eval $(autotools-package))
