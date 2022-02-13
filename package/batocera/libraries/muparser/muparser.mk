################################################################################
#
# muparser
#
################################################################################

MUPARSER_VERSION = v2.3.2
MUPARSER_SITE = $(call github,beltoforion,muparser,$(MUPARSER_VERSION))
MUPARSER_LICENSE = BSD
MUPARSER_DEPENDENCIES = 

MUPARSER_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
MUPARSER_CONF_OPTS += -DBUILD_SHARED_LIBS=ON

$(eval $(cmake-package))
