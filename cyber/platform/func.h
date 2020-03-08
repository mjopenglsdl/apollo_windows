#pragma once


#ifdef __WIN32__
  #include <windows.h>
#else
  #include <sys/syscall.h>
#endif


namespace apollo {
namespace cyber {
namespace platform{

inline int GetThreadId(){
#ifdef __WIN32__
    return ::GetCurrentThreadId();
#else
    return syscall(SYS_gettid);
#endif
}


}  // namespace platform
}  // namespace cyber
}  // namespace apollo