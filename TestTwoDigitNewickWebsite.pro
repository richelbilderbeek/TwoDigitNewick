include(../RibiLibraries/WebApplication.pri)

include(../BinaryNewickVector/BinaryNewickVector.pri)
include(../Newick/Newick.pri)

include(../RibiClasses/CppAbout/CppAbout.pri)
include(../RibiClasses/CppTrace/CppTrace.pri)
include(../RibiClasses/CppTwoDigitNewick/CppTwoDigitNewick.pri)
include(../RibiClasses/CppFuzzy_equal_to/CppFuzzy_equal_to.pri)
include(../RibiClasses/CppWtAboutDialog/CppWtAboutDialog.pri)

include(../RibiLibraries/BigInteger.pri)



QT       += core gui

CONFIG   += console
CONFIG   -= app_bundle

QMAKE_CXXFLAGS += -std=c++0x


LIBS += -lboost_regex -lwt -lwthttp

TEMPLATE = app

SOURCES += \
    wtmain.cpp \
    wttesttwodigitnewickdialog.cpp

HEADERS += \
    wttesttwodigitnewickdialog.h

RESOURCES += \
    TestTwoDigitNewick.qrc

OTHER_FILES += \
    wt.css

# Thanks to Qt
QMAKE_CXXFLAGS += -Wno-unused-variable

# gcov
QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
LIBS += -lgcov

# References
# [1] http://www.richelbilderbeek.nl/CppCompileErrorCc1plusInternalCompilerErrorSegmentationFault.htm

