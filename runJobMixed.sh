#!/bin/bash
cd workDir
productionId=`date +%F_%H-%M`_mix
analyzer="svomich"

mkdir $productionId
cd $productionId
#copylist
cp ../../picoLists/SL22b00.list  ./
list="SL22b00.list"

#copy needed folders
cp -r ../../.sl73_gcc485 ./
cp -Lr ../../StRoot ./
cp ../../picoLists/picoList_bad.list ./
mkdir starSubmit
cp ../../starSubmit/submitPicoHFMaker.xml ./starSubmit

mkdir -p production
mkdir -p report
mkdir -p csh
mkdir -p list
mkdir -p jobsbasePath
mkdir -p jobs/log
mkdir -p jobs/err

path=`pwd -P`
path=$( echo $path | sed 's|//|/|g' )

baseFolder=${path}
rootMacro=runPicoMixedEvent.C
inputList=runs_path_all.list

star-submit-template -template ./starSubmit/submitPicoHFMaker.xml -entities listOfFiles=${inputList},basePath=${baseFolder},prodId=${productionId},rootMacro=${rootMacro}