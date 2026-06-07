################################################################################
#
# rapidyaml
#
################################################################################
# Version: Commits on Jun 05, 2026
RAPIDYAML_VERSION = v0.14.0
RAPIDYAML_SITE = https://github.com/biojppm/rapidyaml/releases/download/$(RAPIDYAML_VERSION)
RAPIDYAML_SOURCE = rapidyaml-$(subst v,,$(RAPIDYAML_VERSION))-src.tgz
RAPIDYAML_LICENSE = GPL-2
RAPIDYAML_SUPPORTS_IN_SOURCE_BUILD = NO
RAPIDYAML_INSTALL_STAGING = YES

$(eval $(cmake-package))
