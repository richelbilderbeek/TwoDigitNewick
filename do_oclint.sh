#!/bin/bash

cpp_files=`ls *.cpp | egrep -v "^qrc_.*\.cpp$" | egrep -v "^moc_.*\.cpp$" | egrep -v "^wt.*\.cpp$" | egrep -v "^.*_test\.cpp$"`
h_files=`ls *.h | egrep -v "^ui_.*\.h$" | egrep -v "^wt.*\.h$"`

./oclint-0.10.3/bin/oclint -o oclint.log \
  -disable-rule ShortVariableName \
  $cpp_files \
  $h_files \
  -- \
  -c -std=c++11 -fPIC \
  -I../BinaryNewickVector \
  -I../ConceptMap \
  -I../Newick \
  -I../NewickVector \
  -I../RibiClasses/CppAbout \
  -I../RibiClasses/CppContainer \
  -I../RibiClasses/CppCounter \
  -I../RibiClasses/CppFuzzy_equal_to \
  -I../RibiClasses/CppGeometry \
  -I../RibiClasses/CppHelp \
  -I../RibiClasses/CppTestTimer \
  -I../RibiClasses/CppFileIo \
  -I../RibiClasses/CppMenuDialog \
  -I../RibiClasses/CppPlane \
  -I../RibiClasses/CppQtAboutDialog \
  -I../RibiClasses/CppQtHideAndShowDialog \
  -I../RibiClasses/CppRibiRegex \
  -I../RibiClasses/CppTrace \
  -I../RibiClasses/CppXml \
  -I../RibiLibraries/Apfloat \
  -I../RibiLibraries/bigint-2010.04.30 \
  -I/usr/include/c++/5 \
  -I/usr/include/x86_64-linux-gnu/c++/5 \
  -I/usr/include/qt4 \
  -I/usr/include/qt4/QtCore \
  -I/usr/include/qt4/QtGui \
  -I/usr/include/qt4/QtPrintSupport \
  -I/usr/include/qt4/QtTest

cat oclint.log

# Will be 0 if success
# Will be 1 if fail
fail=`egrep "Compiler Errors" oclint.log | wc -l`

if [ $fail -eq 1 ]; 
then
  echo "OCLint: Compiler error"
  exit 1
else
  echo "OCLint: OK"
fi

# Will be 1 if success
# Will be 0 if fail
success=`egrep "FilesWithViolations=0 P1=0 P2=0 P3=0" oclint.log | wc -l`

if [ $success -eq 1 ]; 
then
  echo "OCLint: OK"
else
  echo "OCLint: Fail"
  exit 1
fi