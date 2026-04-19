#pragma once

#if defined(_WIN32) || defined(_MSC_VER)
#include <direct.h>
#include <stdlib.h>

// Fix for PATH_MAX and realpath on Windows
#define PATH_MAX 4096
#define realpath(nav, resolved) _fullpath(resolved, nav, PATH_MAX)

// Silence internal rlottie warnings
#define _CRT_SECURE_NO_WARNINGS
#define _CRT_NONSTDC_NO_WARNINGS
#endif

// Tell rlottie we are providing the config
#define HAVE_CONFIG_H 1