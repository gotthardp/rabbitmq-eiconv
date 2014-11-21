RELEASABLE=true
APP_NAME:=eiconv

UPSTREAM_GIT:=https://github.com/zotonic/eiconv.git
UPSTREAM_REVISION:=644fb5e7bd6640fbd073f4d28957914ea979aea0
RETAIN_ORIGINAL_VERSION:=true

ORIGINAL_APP_FILE:=$(CLONE_DIR)/src/eiconv.app.src
DO_NOT_GENERATE_APP_FILE=true

NIF_LIBRARY:=$(CLONE_DIR)/priv/eiconv_nif.so
NIF_SOURCES:=$(CLONE_DIR)/c_src/eiconv_nif.c

CONSTRUCT_APP_PREREQS:=$(NIF_LIBRARY)
define construct_app_commands
	cp -r $(CLONE_DIR)/priv $(APP_DIR)
endef

define package_rules
$(NIF_LIBRARY): $(NIF_SOURCES)
	mkdir -p $(CLONE_DIR)/priv
	gcc $(NIF_SOURCES) -fpic -shared -I /usr/lib/erlang/usr/include -o $(NIF_LIBRARY)
endef
