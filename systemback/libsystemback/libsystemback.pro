QT -= gui

TARGET = systemback

CONFIG += c++11 \
          exceptions_off

TEMPLATE = lib

DEFINES += SYSTEMBACK_LIBRARY \
           _FILE_OFFSET_BITS=64

system(./lcheck.sh):exists(libmount.hpp) {
    DEFINES += C_MNT_LIB
}

SOURCES += sblib.cpp

HEADERS += sblib.hpp \
           sblib_global.hpp \
           sbtypedef.hpp \
           bstr.hpp

RESOURCES += version.qrc

QMAKE_CXXFLAGS += -g \
                  -fno-rtti \
                  -fvisibility=hidden \
                  -fvisibility-inlines-hidden \
                  -fno-asynchronous-unwind-tables \
                  -Wno-implicit-fallthrough \
                  -Wno-deprecated-declarations \
                  -Wno-range-loop-construct \
                  -Wno-format

QMAKE_CXXFLAGS_WARN_ON += -Wno-unused-result

CONFIG(debug, debug|release) {
    QMAKE_CXXFLAGS_WARN_ON += -Wextra \
                              -Wshadow \
                              -Werror
}

QMAKE_LFLAGS += -g \
                -Wl,-Bsymbolic-functions \
                -Wl,--as-needed \
                -fuse-ld=gold \
                -Wl,-z,relro

! equals(QMAKE_CXX, clang++) {
    QMAKE_CXXFLAGS += -flto=auto
    QMAKE_LFLAGS += -flto=auto
}

LIBS += -lmount \
        -lblkid \
        -lparted
