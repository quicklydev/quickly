QML_DIR = $(shell qmake -query QT_INSTALL_QML)/QuickFill
DEST_DIR = /usr/local/bin

.PHONY: build install check example

build:
	qmlify --no-pollyfills src build

install: build
	mkdir -p $(QML_DIR)
	cp build/* $(QML_DIR)
	cp qmlify $(DEST_DIR)

check: install
	qmlify tests tests/build
	qmltestrunner -input tests/build
