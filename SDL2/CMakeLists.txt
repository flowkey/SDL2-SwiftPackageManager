file(GLOB SDL2_SOURCES
    src/*.c
    src/audio/*.c
    src/audio/android/*.c
    src/audio/dummy/*.c
    src/core/android/*.c
    src/cpuinfo/*.c
    src/dynapi/*.c
    src/events/*.c
    src/file/*.c
    src/haptic/*.c
    src/haptic/dummy/*.c
    src/joystick/*.c
    src/joystick/android/*.c
    src/loadso/dlopen/*.c
    src/power/*.c
    src/power/android/*.c
    src/filesystem/android/*.c
    src/render/*.c
    src/render/*/*.c
    src/stdlib/*.c
    src/thread/*.c
    src/thread/pthread/*.c
    src/timer/*.c
    src/timer/unix/*.c
    src/video/*.c
    src/video/android/*.c
    # src/test/*.c
    src/atomic/SDL_atomic.c
    src/atomic/SDL_spinlock.c
)

add_library(SDL SHARED ${SDL2_SOURCES})

include_directories(SDL PUBLIC include)
target_link_libraries(SDL PRIVATE dl GLESv1_CM GLESv2 log android)
target_compile_definitions(SDL PRIVATE GL_GLEXT_PROTOTYPES)

# Import SDL's module map when calling `import SDL`:
set_target_properties(SDL PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${SDL_SOURCE_DIR}/SDL2)
