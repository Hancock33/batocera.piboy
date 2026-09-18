################################################################################
#
# appstream
#
################################################################################
# Version: Commits on Aug 29, 2026
APPSTREAM_VERSION = v1.2.0
APPSTREAM_SITE = $(call github,ximion,appstream,$(APPSTREAM_VERSION))
APPSTREAM_INSTALL_STAGING = YES

APPSTREAM_DEPENDENCIES = host-gperf host-pkgconf libcurl libfyaml libglib2 libxml2 libxmlb
APPSTREAM_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)

APPSTREAM_CONF_OPTS = -Dstemming=false -Dsystemd=false -Dvapi=false -Dqt=false
APPSTREAM_CONF_OPTS += -Dcompose=false -Dblake3-support=false -Dbash-completion=false
APPSTREAM_CONF_OPTS += -Dgir=false -Dtools=false -Ddisplay-detection=none
APPSTREAM_CONF_OPTS += -Ddocs=false -Dapidocs=false -Dinstall-docs=false -Dman=false

ifeq ($(BR2_PACKAGE_ZSTD),y)
APPSTREAM_CONF_OPTS += -Dzstd-support=true
APPSTREAM_DEPENDENCIES += zstd
else
APPSTREAM_CONF_OPTS += -Dzstd-support=false
endif

$(eval $(meson-package))
$(eval $(host-meson-package))
