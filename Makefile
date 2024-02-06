BUILD_OUT_DIR=build
VERSION=0.8.0



################################################################################
#creates libraries to be linked with


.PHONY : release
release:	directories build headers
	cp build/libyaml-cpp.so.${VERSION} ../out/lib

.PHONY : build
build:
	cmake -DYAML_BUILD_SHARED_LIBS=on -B build -S ./
	$(MAKE) -C build yaml-cpp


.PHONY : headers
headers:
	cp -a ./include/. ../out/include/


.PHONY : directories
directories:
	mkdir -p ${BUILD_OUT_DIR} ../out/lib ../out/include

.PHONY : clean
clean:
	rm -rf $(BUILD_OUT_DIR)