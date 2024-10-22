################################################################################
#
# cpuinfo
#
################################################################################
# Version: Commits on Oct 22, 2024
CPUINFO_VERSION = dff2616ddd49122b63abcf44d2c097483b77f861
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
