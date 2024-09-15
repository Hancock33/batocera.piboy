################################################################################
#
# cpuinfo
#
################################################################################
# Version: Commits on Sept 11, 2024
CPUINFO_VERSION = a5ff6df40ce528721cfc310c7ed43946d77404d5
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
