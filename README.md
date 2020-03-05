# apollo_windows
Windows minimal portation (MinGW + CMake) of Baidu's Apollo autonomous driving platform

## Motivations
The Baidu's **Apollo** is a very famous platform for autonomous driving.
I have studied its source code and I think the framework is well designed!

### Why port it to Windows?
The original version of **Apollo** only supports the *Linux* system.
But most people use *Windows* computer on their daily basis. For me, I am not willing to install another os on my desktop in order to study and test the **Apollo** source code

### Why not fork from original repo?
When I downloaded from the original repo in *Feb 2020*, I was shocked by size: oh dear, *1.3GB*! I don't need the whole bunch of files in order to study its architecture. It makes people inconvenient to download and study it. Therefore, I have cut unimportant features and only left the core cyber framework. The compiled *dll* only takes about *10MB*.

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
* Use my **MinGW** version(**v1.5.0** branch) [https://github.com/mjopenglsdl/Fast-RTPS/tree/v1.5.0-msys2-mingw](https://github.com/mjopenglsdl/Fast-RTPS/tree/v1.5.0-msys2-mingw)
* Use my modified version(**v1.5.0** branch, solved std::string serialize problem) [https://github.com/mjopenglsdl/Fast-CDR/tree/compatible-fastrtps-v1.5.0](https://github.com/mjopenglsdl/Fast-CDR/tree/compatible-fastrtps-v1.5.0)



## How to run it?
Under the build directory, you will find a folder called **bin**, all generated lib and executable will be saved here.

### Log
Log will be saved on the same dir as the *exe* file, it is named with current running executable name, like "talker.exe.log.INFO.20200224-150237.7724"

### Configurations
Add environment variable **CYBER_PATH** to *.bachrc*.
```bash
export CYBER_PATH=~/git_repo/apollo_windows
```

### Working examples
The examples are located at **src/examples** folder.
Two working examples are ready to be built and run. **Talker** is the node that send message:
```C++
#include "cyber/cyber.h"
#include "examples/proto/examples.pb.h"
#include "cyber/time/rate.h"
#include "cyber/time/time.h"

using apollo::cyber::Rate;
using apollo::cyber::Time;
using apollo::cyber::examples::proto::Chatter;

int main(int argc, char *argv[]) 
{
  // init cyber framework
  apollo::cyber::Init(argv[0]);

  // create talker node
  auto talker_node = apollo::cyber::CreateNode("talker");
  // create talker
  auto talker = talker_node->CreateWriter<Chatter>("channel/chatter");
  Rate rate(1.0);

  while (apollo::cyber::OK()) {
    static uint64_t seq = 0;
    auto msg = std::make_shared<Chatter>();
    msg->set_timestamp(Time::Now().ToNanosecond());
    msg->set_lidar_timestamp(Time::Now().ToNanosecond());
    msg->set_seq(seq++);
    msg->set_content("Hello, apollo!");
    talker->Write(msg);
    AINFO << "talker sent a message!";
    rate.Sleep();
  }
  return 0;
}
```

The **Listener** receives message:
```C++
#include "cyber/cyber.h"
#include "examples/proto/examples.pb.h"

void MessageCallback(
    const std::shared_ptr<apollo::cyber::examples::proto::Chatter>& msg) {
  AINFO << "Received message seq-> " << msg->seq();
  AINFO << "msgcontent->" << msg->content();
}

int main(int argc, char* argv[]) 
{
  // init cyber framework
  apollo::cyber::Init(argv[0]);

  // create listener node
  auto listener_node = apollo::cyber::CreateNode("listener");
  
  // create listener
  auto listener =
      listener_node->CreateReader<apollo::cyber::examples::proto::Chatter>(
          "channel/chatter", MessageCallback);
  apollo::cyber::WaitForShutdown();
  return 0;
}
```


## Copyright
* The license belongs to the original Apollo Team [https://github.com/ApolloAuto/apollo](https://github.com/ApolloAuto/apollo)


## Windows portation
* Minjie [https://github.com/mjopenglsdl](https://github.com/mjopenglsdl)
* Contributors are welcome !
