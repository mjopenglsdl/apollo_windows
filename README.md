# apollo_windows
Windows minimal portation(CMake) of Baidu's Apollo autonomous driving platform

## Motivations
The Baidu's **Apollo** is a very famous platform for autonomous driving.
I have studied its source code and I think it is well designed!

### Why port it wo Windows?
The original version of **Apollo** only supports the *Linux* system.
But most people use *Windows* computor on their daily basis. For me, I am not willing to install another os for my desktop in order to study and test the **Apollo** source code

### Why not fork from original repo?
When I downloaded from the original repo in *Feb 2020*, I was shocked by size: wow, *1.3GB*!. I don't need the whole bunch of files in order to study its architecture. It makes people inconvenient to download and study it. Therefore, I have cut some unimportant features and only leave some core features. The compiled *dll* only takes about *10MB*.

### Why not use Bazel for the build system?
I am not a *Java* fan and I don't really want to install a Java runtime on my machine. Plus, the download of *Bazel* is slow.
**CMake** is commonly used for C++ project. All of its dependencies was supports cmake as well.

## Progress
Currently I have make core lib **libapollo** as a *dll* and have successfilly compiled it. I have commented out some Linux specific code to make it compile. There is still some further work. But it does affect you to run it :-)


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


## Copyright
* The license belongs to the original Apollo Team [https://github.com/ApolloAuto/apollo](https://github.com/ApolloAuto/apollo)


## Windows portation
* Minjie [https://github.com/mjopenglsdl](https://github.com/mjopenglsdl)
* Contributors are welcome !
