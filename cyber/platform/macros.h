#pragma once


#ifdef __MINGW32__
    #undef GetClassName

    #define DT_DIR 0
#endif


#ifdef __WIN32__

    #ifdef CYBER_EXPORTS
        #define CYBER_API __declspec(dllexport)
    #else
        #define CYBER_API __declspec(dllimport)
    #endif

#else
    #define CYBER_API 
#endif