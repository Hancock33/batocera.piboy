################################################################################
#
# xproto_xf86miscproto -- X.Org XF86Misc protocol headers
#
################################################################################

XPROTO_XF86MISCPROTO_VERSION = 0.9.3
XPROTO_XF86MISCPROTO_SOURCE = xf86miscproto-$(XPROTO_XF86MISCPROTO_VERSION).tar.bz2
XPROTO_XF86MISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
XPROTO_XF86MISCPROTO_AUTORECONF = NO
XPROTO_XF86MISCPROTO_INSTALL_STAGING = YES
XPROTO_XF86MISCPROTO_INSTALL_TARGET = NO

$(eval $(call AUTOTARGETS,package/x11r7,xproto_xf86miscproto))
