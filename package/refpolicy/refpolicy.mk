################################################################################
#
# refpolicy
#
################################################################################

REFPOLICY_VERSION = RELEASE_2_20170204

# Do not use GitHub helper as git submodules are needed for refpolicy-contrib
REFPOLICY_SITE = https://github.com/TresysTechnology/refpolicy.git
REFPOLICY_SITE_METHOD = git
REFPOLICY_GIT_SUBMODULES = y # Required for refpolicy-contrib
REFPOLICY_LICENSE = GPL-2.0
REFPOLICY_LICENSE_FILES = COPYING
REFPOLICY_INSTALL_STAGING = YES
REFPOLICY_DEPENDENCIES = \
	host-m4 \
	host-checkpolicy \
	host-policycoreutils \
	host-setools \
	host-gawk \
	host-python \
	policycoreutils

# Cannot use multiple threads to build the reference policy
REFPOLICY_MAKE = \
	TEST_TOOLCHAIN=$(HOST_DIR) \
	PYTHON="$(HOST_DIR)/usr/bin/python2" \
	$(TARGET_MAKE_ENV) \
	$(MAKE1)

define REFPOLICY_CONFIGURE_CMDS
	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = 30" $(@D)/build.conf
	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
	$(SED) "/NAME/c\NAME = targeted" $(@D)/build.conf
endef

define REFPOLICY_BUILD_CMDS
	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) bare conf
endef

define REFPOLICY_INSTALL_STAGING_CMDS
	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) \
		install-src install-headers
endef

define REFPOLICY_INSTALL_TARGET_CMDS
	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))
