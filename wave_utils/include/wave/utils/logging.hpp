#ifndef __WAVE_UTILS_LOGGING_HPP__
#define __WAVE_UTILS_LOGGING_HPP__

namespace wave {

#define __FILENAME__ \
    (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__)

#define LOG_ERROR(M, ...)              \
    fprintf(stderr,                    \
            "[ERROR] [%s:%d] " M "\n", \
            __FILENAME__,              \
            __LINE__,                  \
            ##__VA_ARGS__)

#define LOG_INFO(M, ...) fprintf(stdout, "[INFO] " M "\n", ##__VA_ARGS__)

}  // end of wave namespace
#endif
