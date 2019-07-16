add_library(SDL_gpu STATIC
    SDL_gpu.c
    renderer_GLES_3.c
    SDL_gpu_matrix.c
    renderer_OpenGL_1.c
    SDL_gpu_renderer.c
    SDL_gpu_shapes.c
    renderer_GLES_1.c
    renderer_OpenGL_1_BASE.c
    renderer_OpenGL_2.c
    renderer_OpenGL_3.c
    renderer_OpenGL_4.c
    renderer_GLES_2.c
    externals/stb_image/stb_image.c
    externals/stb_image_write/stb_image_write.c
)

target_compile_definitions(SDL_gpu PRIVATE
    SDL_GPU_DISABLE_OPENGL
    GL_GLEXT_PROTOTYPES)

set_target_properties(SDL_gpu PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES
        "${SDL_SOURCE_DIR}/sdl-gpu ${SDL_SOURCE_DIR}/SDL2/include"
)

target_include_directories(SDL_gpu PUBLIC
    ${SDL_SOURCE_DIR}/SDL2/include
    include
    externals/glew/GL)
