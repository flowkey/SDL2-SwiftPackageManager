include(ExternalProject)

project(SDL LANGUAGES C)
add_subdirectory(SDL2)

add_subdirectory(sdl-gpu)
target_link_libraries(SDL PUBLIC SDL_gpu)

add_subdirectory(SDL_ttf)
target_link_libraries(SDL PUBLIC SDL_ttf)
