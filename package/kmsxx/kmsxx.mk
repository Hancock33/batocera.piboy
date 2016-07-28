################################################################################
#
# kmsxx
#
################################################################################

KMSXX_VERSION = a706f157b86e90696808025db01de99646d51a77
KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
KMSXX_LICENSE = MPLv2.0
KMSXX_LICENSE_FILES = LICENSE
KMSXX_INSTALL_STAGING = YES
KMSXX_DEPENDENCIES = libdrm host-pkgconf
KMSXX_CONF_OPTS = -DKMSXX_ENABLE_PYTHON=OFF

ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
KMSXX_TESTS = \
	fbtestpat kmsblank kmscapture \
	kmsprint kmsview testpat wbcap \
	wbm2m

define KMSXX_INSTALL_TARGET_TESTS
	$(foreach t,$(KMSXX_TESTS),\
		$(INSTALL) -D -m 0755 $(@D)/bin/$(t) \
			$(TARGET_DIR)/usr/bin/$(t)
	)
endef
endif

KMSXX_LIBS = kms++ kms++util

define KMSXX_INSTALL_TARGET_CMDS
	$(foreach l,$(KMSXX_LIBS),\
		$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
			$(TARGET_DIR)/usr/lib/lib$(l).so
	)
	$(KMSXX_INSTALL_TARGET_TESTS)
endef

define KMSXX_INSTALL_STAGING_CMDS
	$(foreach l,$(KMSXX_LIBS),\
		$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
			$(STAGING_DIR)/usr/lib/lib$(l).so ; \
		mkdir -p $(STAGING_DIR)/usr/include/$(l) ; \
		cp -dpfr $(@D)/$(l)/inc/$(l)/* $(STAGING_DIR)/usr/include/$(l)/
	)
endef

$(eval $(cmake-package))
