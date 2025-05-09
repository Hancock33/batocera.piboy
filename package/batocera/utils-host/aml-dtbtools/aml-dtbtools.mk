################################################################################
#
# aml-dtbtools
#
################################################################################
# Version: Commits on Jul 31, 2017
AML_DTBTOOLS_VERSION = b2ca13ce06627d4e38b3fce56d7aadf077b7bc7d
AML_DTBTOOLS_SITE = $(call github,Wilhansen,aml-dtbtools,$(AML_DTBTOOLS_VERSION))

define HOST_AML_DTBTOOLS_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) -f Makefile
endef

define HOST_AML_DTBTOOLS_INSTALL_CMDS
	$(INSTALL) -m 0755 -D $(@D)/dtbTool $(HOST_DIR)/bin/dtbTool
	$(INSTALL) -m 0755 -D  $(@D)/dtbSplit $(HOST_DIR)/bin/dtbSplit
endef

$(eval $(host-generic-package))
