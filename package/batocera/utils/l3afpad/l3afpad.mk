################################################################################
#
# L3AFPAD
#
################################################################################
# Version.: Commits on Dec 19, 2017
L3AFPAD_VERSION = 5235c9e13bbf0d31a902c6776918c2d7cdbb61ff
L3AFPAD_SITE = $(call github,stevenhoneyman,l3afpad,$(L3AFPAD_VERSION))

L3AFPAD_DEPENDENCIES = libgtk3 host-intltool harfbuzz
L3AFPAD_LICENSE = GPL-2.0+
L3AFPAD_LICENSE_FILES = COPYING

define L3AFPAD_CONFIGURE_CMDS
    cd $(@D); PATH=$(HOST_DIR)/bin:$(PATH) ./autogen.sh ; \
    $(TARGET_CONFIGURE_OPTS) PREFIX=$(STAGING_DIR) CFLAGS="-I$(STAGING_DIR)/usr/include" LDFLAGS="-L$(STAGING_DIR)/usr/lib" ./configure --disable-nls --prefix=/usr
endef

$(eval $(autotools-package))
