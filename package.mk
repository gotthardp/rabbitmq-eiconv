RELEASABLE=true
APP_NAME:=eiconv

UPSTREAM_GIT:=https://github.com/zotonic/eiconv.git
UPSTREAM_REVISION:=644fb5e7bd6640fbd073f4d28957914ea979aea0
RETAIN_ORIGINAL_VERSION:=true

ORIGINAL_APP_FILE:=$(CLONE_DIR)/src/eiconv.app.src
DO_NOT_GENERATE_APP_FILE=true

define package_rules

$(CLONE_DIR)/src/$(APP_NAME).app.src: $(CLONE_DIR)/.done
	sed -i 's/git/"0.4.0"/' $(CLONE_DIR)/src/$(APP_NAME).app.src

endef
