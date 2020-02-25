# apollo_windows
Windows minimal portation (MinGW + CMake) of Baidu's Apollo autonomous driving platform

## Motivations
The Baidu's **Apollo** is a very famous platform for autonomous driving.
I have studied its source code and I think the framework is well designed!

### Why port it to Windows?
The original version of **Apollo** only supports the *Linux* system.
But most people use *Windows* computor on their daily basis. For me, I am not willing to install another os for my desktop in order to study and test the **Apollo** source code

### Why not fork from original repo?
When I downloaded from the original repo in *Feb 2020*, I was shocked by size: oh dear, *1.3GB*! I don't need the whole bunch of files in order to study its architecture. It makes people inconvenient to download and study it. Therefore, I have cut some unimportant features and only leave some core features. The compiled *dll* only takes about *10MB*.

### Why not use Bazel for the build system?
I am not a fan of *Java* and I don't really want to install a Java runtime on my machine. 
**CMake** is commonly used for C++ project. All of its dependencies support cmake as well.


## Progress
Currently I have successfilly compiled the core lib **libcyber.dll** as and have the *mainboard* program to run. I have commented out some Linux specific code to make it compile. There is still some further work.


## Windows environment
* MSYS2
* MinGW64
* cmake

## Dependencies
```cmake
find_package(glog REQUIRED)
find_package(gflags REQUIRED)
find_package(gtest REQUIRED)

find_package(Protobuf REQUIRED)
find_package(fastcdr REQUIRED)
find_package(fastrtps REQUIRED)
find_package(Poco REQUIRED Foundation)
```

## Install Dependencies
### Fast-RTPS
Use my **MinGW** version(**v1.5.0** branch) [https://github.com/mjopenglsdl/Fast-RTPS/tree/v1.5.0-msys2-mingw](https://github.com/mjopenglsdl/Fast-RTPS/tree/v1.5.0-msys2-mingw)


## How to run it?
Under the build directory, you will find a folder called **bin**, all generated lib and executable will be saved here.

### Log
Log will be saved on the same dir as the *exe* file, it is named with current running executable name, like "talker.exe.log.INFO.20200224-150237.7724"


## Copyright
* The license belongs to the original Apollo Team [https://github.com/ApolloAuto/apollo](https://github.com/ApolloAuto/apollo)


## Windows portation
* Minjie [https://github.com/mjopenglsdl](https://github.com/mjopenglsdl)
* Contributors are welcome !
