################################################################################
#
# czmq
#
################################################################################

CZMQ_VERSION = v3.0.0
CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))

# Autoreconf required as we use the git tree
CZMQ_AUTORECONF = YES
CZMQ_INSTALL_STAGING = YES
CZMQ_DEPENDENCIES = zeromq
CZMQ_LICENSE = MPLv2.0
CZMQ_LICENSE_FILES = LICENSE

# asciidoc is a python script that imports unicodedata, which is not in
# host-python, so disable asciidoc entirely.
CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no

# zeromq uses C++, but czmq forgets to explicitly link with libstdc++
# (or use g++ to link), breaking static linking.
ifeq ($(BR2_STATIC_LIBS),y)
CZMQ_CONF_ENV += LIBS='-lstdc++'
endif

define CZMQ_CREATE_CONFIG_DIR
	mkdir -p $(@D)/config
endef

CZMQ_POST_PATCH_HOOKS += CZMQ_CREATE_CONFIG_DIR

$(eval $(autotools-package))
