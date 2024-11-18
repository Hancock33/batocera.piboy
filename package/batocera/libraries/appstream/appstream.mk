################################################################################
#
# appstream
#
################################################################################
# Version: Commits on Apr 24, 2024
APPSTREAM_VERSION = v1.0.3
APPSTREAM_SITE = $(call github,ximion,appstream,$(APPSTREAM_VERSION))
APPSTREAM_INSTALL_STAGING = YES

APPSTREAM_DEPENDENCIES = libxmlb host-appstream
HOST_APPSTREAM_DEPENDENCIES = host-brotli host-libxmlb

APPSTREAM_CONF_OPTS = -Dgir=true -Dstemming=false -Dsystemd=false -Dzstd-support=true
APPSTREAM_CONF_OPTS += -Ddocs=false -Dapidocs=false -Dinstall-docs=false
HOST_APPSTREAM_CONF_OPTS = -Dgir=false -Dstemming=false -Dsystemd=false -Dzstd-support=true
HOST_APPSTREAM_CONF_OPTS += -Ddocs=false -Dapidocs=false -Dinstall-docs=false

APPSTREAM_CONF_ENV = LD_LIBRARY_PATH=$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH) PATH=$(HOST_DIR)/usr/bin:$(PATH)

$(eval $(meson-package))
$(eval $(host-meson-package))
