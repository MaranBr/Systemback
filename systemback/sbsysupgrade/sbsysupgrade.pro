QT -= gui
QT += core

TARGET = sbsysupgrade

CONFIG -= app_bundle
CONFIG += console \
          c++13 \
          exceptions_off

TEMPLATE = app

DEFINES += _FILE_OFFSET_BITS=64

SOURCES += sbsysupgrade.cpp

QMAKE_CXXFLAGS += -g \
                  -fno-rtti \
                  -fvisibility=hidden \
                  -fvisibility-inlines-hidden \
                  -fno-asynchronous-unwind-tables \
                  -Wno-implicit-fallthrough \
                  -Wno-deprecated-declarations \
                  -Wno-range-loop-construct \
                  -Wno-format

CONFIG(debug, debug|release) {
    QMAKE_CXXFLAGS_WARN_ON += -Wextra \
                              -Wshadow \
                              -Werror
}

QMAKE_LFLAGS += -g \
                -Wl,-rpath=/usr/lib/systemback \
                -Wl,--as-needed \
                -fuse-ld=gold \
                -Wl,-z,relro

! equals(QMAKE_CXX, clang++) {
    QMAKE_CXXFLAGS += -flto=auto
    QMAKE_LFLAGS += -flto=auto
}

LIBS += -L../libsystemback \
        -lsystemback
