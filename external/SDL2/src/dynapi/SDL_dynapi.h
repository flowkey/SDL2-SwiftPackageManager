/*
  Simple DirectMedia Layer
  Copyright (C) 1997-2016 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

#ifndef _SDL_dynapi_h
#define _SDL_dynapi_h

#ifdef __APPLE__
#include "TargetConditionals.h"
#endif

#if defined(TARGET_OS_IPHONE) && TARGET_OS_IPHONE  /* probably not useful on iOS. */
#define SDL_DYNAMIC_API 0
#elif defined(__native_client__) && __native_client__  /* probably not useful on NACL. */
#define SDL_DYNAMIC_API 0
#elif defined(__EMSCRIPTEN__) && __EMSCRIPTEN__  /* probably not useful on Emscripten. */
#define SDL_DYNAMIC_API 0
#elif defined(SDL_BUILDING_WINRT) && SDL_BUILDING_WINRT  /* probably not useful on WinRT, given current .dll loading restrictions */
#define SDL_DYNAMIC_API 0
#elif defined(__PSP__) && __PSP__
#define SDL_DYNAMIC_API 0
#elif defined(__clang_analyzer__)
#define SDL_DYNAMIC_API 0  /* Turn off for static analysis, so reports are more clear. */
#endif

/* everyone else. This is where we turn on the API if nothing forced it off. */
#ifndef SDL_DYNAMIC_API
#define SDL_DYNAMIC_API 1
#endif

#endif

/* vi: set ts=4 sw=4 expandtab: */
