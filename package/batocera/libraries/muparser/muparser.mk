################################################################################
#
# muparser
#
################################################################################

MUPARSER_VERSION = v2.3.2
MUPARSER_SITE = $(call github,beltoforion,muparser,$(MUPARSER_VERSION))
MUPARSER_LICENSE = BSD
MUPARSER_DEPENDENCIES =
MUPARSER_INSTALL_STAGING = YES

MUPARSER_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
MUPARSER_CONF_OPTS += -DBUILD_SHARED_LIBS=ON

define MUPARSER_INSTALL_TARGET_CMDS
	cp -avr $(@D)/libmuparser.so* $(TARGET_DIR)/usr/lib
endef

$(eval $(cmake-package))
