################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Jul 03, 2025
PM_DASHBOARD_VERSION = 6f9e40eaf742e8ca985b069fc0db9b0c885dacec
PM_DASHBOARD_BRANCH = 1.2.x
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
