################################################################################
#
# cpuinfo
#
################################################################################
# Version: Commits on Jan 10, 2025
CPUINFO_VERSION = 8a1772a0c5c447df2d18edf33ec4603a8c9c04a6
CPUINFO_SITE = $(call github,pytorch,cpuinfo,$(CPUINFO_VERSION))

CPUINFO_LICENSE = BSD-2-Clause
CPUINFO_INSTALL_STAGING = YES
CPUINFO_SUPPORTS_IN_SOURCE_BUILD = NO

CPUINFO_CONF_OPTS += -DCPUINFO_BUILD_TOOLS=OFF
CPUINFO_CONF_OPTS += -DCPUINFO_BUILD_UNIT_TESTS=OFF
CPUINFO_CONF_OPTS += -DCPUINFO_BUILD_MOCK_TESTS=OFF
CPUINFO_CONF_OPTS += -DCPUINFO_BUILD_BENCHMARKS=OFF
CPUINFO_CONF_OPTS += -DUSE_SYSTEM_LIBS=ON

$(eval $(cmake-package))
