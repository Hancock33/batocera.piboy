################################################################################
#
# date
#
################################################################################
# Version: Commits on Jul 23, 2026
DATE_VERSION = v3.0.5
DATE_SITE =  $(call github,HowardHinnant,date,$(DATE_VERSION))
DATE_LICENSE = MIT license
DATE_LICENSE_FILES = LICENSE.txt
DATE_SUPPORTS_IN_SOURCE_BUILD = NO
DATE_INSTALL_STAGING = YES
DATE_INSTALL_TARGET = NO

$(eval $(cmake-package))
