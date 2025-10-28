# recreating the build error caused by qt + gazebo gz-jetty

this repo demonstrates dependency hell due to build tools! jk. its worse than hell. 

 its 2am. pls help me.


anyways, it basically runs cmake's find_package in a sample homebrew setup to see how you could run into an issue with it anchoring onto one package but then not finding the proper config file needed for a cmponent

this causes issues. many.

how does find_package work?

1. goes into module mode, if it fails, it goes into config mode
2. config mode searches for file <packageName>-config.cmake or <packageName>Config.cmake
3: executes the config mode search procedure which goes through a set of places to look for variables and paths
4. identified configuration file is read and processed by CMake


sources:
https://cmake.org/cmake/help/latest/command/find_package.html
https://cmake.org/cmake/help/latest/command/find_package.html#search-procedure
https://github.com/osrf/homebrew-simulation/blob/a5789ce4da755ad6356de8bcf0d209a630bbc004/Formula/gz-sim10.rb
https://github.com/gazebosim/gz-gui/blob/982993998efd8b5337578d8cd927d32818364532/CMakeLists.txt


## oh, how to fix it, you ask? AHAHHAHAHAHAHAHAH

left as an exercise to the reader.

jk, again, kek! 

basically get it to anchor onto the right config file for quick, or unlink qtbase since you probably don't need that. lots of options!
