################################################################################
#
# mali-g31-gbm
#
################################################################################
# Version.: Commits on Aug 10, 2021
APPSTREAM_GLIB_VERSION = 3fa624026f608ef8465fb339f86725aaf648e09f
APPSTREAM_GLIB_SITE = $(call github,hughsie,appstream-glib,$(APPSTREAM_GLIB_VERSION))
APPSTREAM_GLIB_INSTALL_STAGING = YES

APPSTREAM_GLIB_DEPENDENCIES = libgtk3 rpm libyaml json-glib

APPSTREAM_GLIB_CONF_OPTS = -Dstemmer=false -Dintrospection=false -Dbuilder=false -Dman=false -Dgtk-doc=false

$(eval $(meson-package))
