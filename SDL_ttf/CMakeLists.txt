add_subdirectory(external/freetype-2.9.1)

add_library(SDL_ttf STATIC SDL_ttf.c SDL_ttf.h)

set_target_properties(SDL_ttf PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES
        "${SDL_SOURCE_DIR}/SDL_ttf ${SDL_SOURCE_DIR}/SDL2/include")

target_link_libraries(SDL_ttf PUBLIC freetype)

target_include_directories(SDL_ttf
    PUBLIC
        include
    PRIVATE
        ${SDL_SOURCE_DIR}/SDL2/include
        external/freetype-2.9.1/include)
