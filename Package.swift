// swift-tools-version:5.7
import PackageDescription

// These files are shared between Mac and Android.
// SwiftPM complains if two targets try to build the same files,
// so we use this target to build all the common files separately.
let sdlCommon = Target.target(
    name: "SDL",
    dependencies: [
        .target(
            name: "SDL_macOS",
            condition: .when(platforms: [.macOS])
        ),
        .target(
            name: "SDL_Android",
            condition: .when(platforms: [.android])
        )
    ],
    path: "SDL2",
    sources: [
        "src/atomic/SDL_atomic.c",
        "src/atomic/SDL_spinlock.c",
        "src/audio/dummy/SDL_dummyaudio.c",
        "src/audio/SDL_audio.c",
        "src/audio/SDL_audiocvt.c",
        "src/audio/SDL_audiodev.c",
        "src/audio/SDL_audiotypecvt.c",
        "src/audio/SDL_mixer.c",
        "src/audio/SDL_wave.c",
        "src/cpuinfo/SDL_cpuinfo.c",
        "src/dynapi/SDL_dynapi.c",
        "src/events/SDL_clipboardevents.c",
        "src/events/SDL_dropevents.c",
        "src/events/SDL_events.c",
        "src/events/SDL_gesture.c",
        "src/events/SDL_keyboard.c",
        "src/events/SDL_mouse.c",
        "src/events/SDL_quit.c",
        "src/events/SDL_touch.c",
        "src/events/SDL_windowevents.c",
        "src/file/SDL_rwops.c",
        "src/haptic/dummy/SDL_syshaptic.c",
        "src/haptic/SDL_haptic.c",
        "src/joystick/SDL_gamecontroller.c",
        "src/joystick/SDL_joystick.c",
        "src/loadso/dlopen/SDL_sysloadso.c",
        "src/power/SDL_power.c",
        "src/render/SDL_render.c",
        "src/render/SDL_yuv_sw.c",
        "src/SDL.c",
        "src/SDL_assert.c",
        "src/SDL_error.c",
        "src/SDL_hints.c",
        "src/SDL_log.c",
        "src/stdlib/SDL_getenv.c",
        "src/stdlib/SDL_iconv.c",
        "src/stdlib/SDL_malloc.c",
        "src/stdlib/SDL_qsort.c",
        "src/stdlib/SDL_stdlib.c",
        "src/stdlib/SDL_string.c",
        "src/thread/pthread/SDL_syscond.c",
        "src/thread/pthread/SDL_sysmutex.c",
        "src/thread/pthread/SDL_syssem.c",
        "src/thread/pthread/SDL_systhread.c",
        "src/thread/pthread/SDL_systls.c",
        "src/thread/SDL_thread.c",
        "src/timer/SDL_timer.c",
        "src/timer/unix/SDL_systimer.c",
        "src/video/SDL_blit.c",
        "src/video/SDL_blit_0.c",
        "src/video/SDL_blit_1.c",
        "src/video/SDL_blit_A.c",
        "src/video/SDL_blit_auto.c",
        "src/video/SDL_blit_copy.c",
        "src/video/SDL_blit_N.c",
        "src/video/SDL_blit_slow.c",
        "src/video/SDL_bmp.c",
        "src/video/SDL_clipboard.c",
        "src/video/SDL_egl.c",
        "src/video/SDL_fillrect.c",
        "src/video/SDL_pixels.c",
        "src/video/SDL_rect.c",
        "src/video/SDL_RLEaccel.c",
        "src/video/SDL_shape.c",
        "src/video/SDL_stretch.c",
        "src/video/SDL_surface.c",
        "src/video/SDL_video.c",
    ],
    cSettings: [
        .define("SDL_RENDER_DISABLED"),
        .define("SDL2_EXPORTS"),
        .define("USING_GENERATED_CONFIG_H"),
        .define("_THREAD_SAFE"),
        .define("SDL_BUILD_MAJOR_VERSION", to: "2"),
        .define("SDL_BUILD_MINOR_VERSION", to: "0"),
        .define("SDL_BUILD_MICRO_VERSION", to: "9"),
        .define("SDL_DYNAMIC_API", to: "0")
    ]
)

let sdlAndroid: Target = .target(
    name: "SDL_Android",
    path: "SDL2",
    sources: [
        // extracted from SDL2/Android.mk
        "src/audio/android/SDL_androidaudio.c",
        "src/core/android/SDL_android.c",
        "src/filesystem/android/SDL_sysfilesystem.c",
        "src/joystick/android/SDL_sysjoystick.c",
        "src/power/android/SDL_syspower.c",
        "src/video/android/SDL_androidclipboard.c",
        "src/video/android/SDL_androidevents.c",
        "src/video/android/SDL_androidgl.c",
        "src/video/android/SDL_androidkeyboard.c",
        "src/video/android/SDL_androidmessagebox.c",
        "src/video/android/SDL_androidmouse.c",
        "src/video/android/SDL_androidtouch.c",
        "src/video/android/SDL_androidvideo.c",
        "src/video/android/SDL_androidwindow.c",
    ],
    cSettings: [
        .define("SDL2_EXPORTS"),
        .define("GL_GLEXT_PROTOTYPES"),
        .define("SDL_DYNAMIC_API", to: "0")
    ],
    linkerSettings: [
       .linkedLibrary("android", .when(platforms: [.android])),
       .linkedLibrary("log", .when(platforms: [.android])),
    ]
)

let sdlMacOS: Target = .target(
    name: "SDL_macOS",
    path: "SDL2",
    sources: [
        // created by calling "cmake -G Ninja SDL2" and getting the files needed for a static build from the ninja build file
        "src/audio/coreaudio/SDL_coreaudio.m",
        "src/audio/disk/SDL_diskaudio.c",
        "src/file/cocoa/SDL_rwopsbundlesupport.m",
        "src/filesystem/cocoa/SDL_sysfilesystem.m",
        "src/haptic/darwin/SDL_syshaptic.c",
        "src/joystick/darwin/SDL_sysjoystick.c",
        "src/libm/e_atan2.c",
        "src/libm/e_log.c",
        "src/libm/e_pow.c",
        "src/libm/e_rem_pio2.c",
        "src/libm/e_sqrt.c",
        "src/libm/k_cos.c",
        "src/libm/k_rem_pio2.c",
        "src/libm/k_sin.c",
        "src/libm/k_tan.c",
        "src/libm/s_atan.c",
        "src/libm/s_copysign.c",
        "src/libm/s_cos.c",
        "src/libm/s_fabs.c",
        "src/libm/s_floor.c",
        "src/libm/s_scalbn.c",
        "src/libm/s_sin.c",
        "src/libm/s_tan.c",
        "src/power/macosx/SDL_syspower.c",
        "src/video/cocoa/SDL_cocoaclipboard.m",
        "src/video/cocoa/SDL_cocoaevents.m",
        "src/video/cocoa/SDL_cocoakeyboard.m",
        "src/video/cocoa/SDL_cocoamessagebox.m",
        "src/video/cocoa/SDL_cocoamodes.m",
        "src/video/cocoa/SDL_cocoamouse.m",
        "src/video/cocoa/SDL_cocoamousetap.m",
        "src/video/cocoa/SDL_cocoaopengl.m",
        "src/video/cocoa/SDL_cocoashape.m",
        "src/video/cocoa/SDL_cocoavideo.m",
        "src/video/cocoa/SDL_cocoawindow.m",
        "src/video/dummy/SDL_nullevents.c",
        "src/video/dummy/SDL_nullframebuffer.c",
        "src/video/dummy/SDL_nullvideo.c"
    ],
    cSettings: [
        .define("SDL2_EXPORTS"),
        .define("SDL_DYNAMIC_API", to: "0"),
        .define("USING_GENERATED_CONFIG_H"),
        .define("_THREAD_SAFE"),
        .unsafeFlags(["-fno-objc-arc"])
    ],
    linkerSettings: [
        .linkedFramework("AudioToolbox", .when(platforms: [.macOS])),
        .linkedFramework("Carbon", .when(platforms: [.macOS])),
        .linkedFramework("Cocoa", .when(platforms: [.macOS])),
        .linkedFramework("CoreAudio", .when(platforms: [.macOS])),
        .linkedFramework("CoreVideo", .when(platforms: [.macOS])),
        .linkedFramework("ForceFeedback", .when(platforms: [.macOS])),
        .linkedFramework("IOKit", .when(platforms: [.macOS])),
    ]
)

let package = Package(
    name: "SDL",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(name: "SDL", targets: ["SDL", "SDL_ttf", "SDL_gpu"]),
    ],
    targets: [
        sdlCommon,
        sdlAndroid,
        sdlMacOS,
        .target(
            name: "SDL_ttf",
            dependencies: ["SDL"],
            path: "SDL_ttf",
            sources: [
                "SDL_ttf.c",
                // Build and statically link freetype.
                // The file list is from building via CMake and extract from the Ninja output:
                "external/freetype-2.9.1/src/autofit/autofit.c",
                "external/freetype-2.9.1/src/base/ftbase.c",
                "external/freetype-2.9.1/src/base/ftbbox.c",
                "external/freetype-2.9.1/src/base/ftbdf.c",
                "external/freetype-2.9.1/src/base/ftbitmap.c",
                "external/freetype-2.9.1/src/base/ftcid.c",
                "external/freetype-2.9.1/src/base/ftfstype.c",
                "external/freetype-2.9.1/src/base/ftgasp.c",
                "external/freetype-2.9.1/src/base/ftglyph.c",
                "external/freetype-2.9.1/src/base/ftgxval.c",
                "external/freetype-2.9.1/src/base/ftinit.c",
                "external/freetype-2.9.1/src/base/ftmm.c",
                "external/freetype-2.9.1/src/base/ftotval.c",
                "external/freetype-2.9.1/src/base/ftpatent.c",
                "external/freetype-2.9.1/src/base/ftpfr.c",
                "external/freetype-2.9.1/src/base/ftstroke.c",
                "external/freetype-2.9.1/src/base/ftsynth.c",
                "external/freetype-2.9.1/src/base/ftsystem.c",
                "external/freetype-2.9.1/src/base/fttype1.c",
                "external/freetype-2.9.1/src/base/ftwinfnt.c",
                "external/freetype-2.9.1/src/bdf/bdf.c",
                "external/freetype-2.9.1/src/bzip2/ftbzip2.c",
                "external/freetype-2.9.1/src/cache/ftcache.c",
                "external/freetype-2.9.1/src/cff/cff.c",
                "external/freetype-2.9.1/src/cid/type1cid.c",
                "external/freetype-2.9.1/src/gzip/ftgzip.c",
                "external/freetype-2.9.1/src/lzw/ftlzw.c",
                "external/freetype-2.9.1/src/pcf/pcf.c",
                "external/freetype-2.9.1/src/pfr/pfr.c",
                "external/freetype-2.9.1/src/psaux/psaux.c",
                "external/freetype-2.9.1/src/pshinter/pshinter.c",
                "external/freetype-2.9.1/src/psnames/psnames.c",
                "external/freetype-2.9.1/src/raster/raster.c",
                "external/freetype-2.9.1/src/sfnt/sfnt.c",
                "external/freetype-2.9.1/src/smooth/smooth.c",
                "external/freetype-2.9.1/src/truetype/truetype.c",
                "external/freetype-2.9.1/src/type1/type1.c",
                "external/freetype-2.9.1/src/type42/type42.c",
                "external/freetype-2.9.1/src/winfonts/winfnt.c",
                "external/freetype-2.9.1/src/base/ftdebug.c",
            ],
            cSettings: [
                .define("FT2_BUILD_LIBRARY"),
                .define("FT_CONFIG_OPTION_SYSTEM_ZLIB")
            ],
            linkerSettings: [
                .linkedLibrary("z")
            ]
        ),
        .target(
            name: "SDL_gpu",
            dependencies: [
                .target(name: "Cstb_image"),
                .target(name: "SDL"),
                .target(name: "Cglew", condition: .when(platforms: [.macOS]))
            ],
            path: "sdl-gpu",
            sources: [
                "SDL_gpu.c",
                "SDL_gpu_matrix.c",
                "SDL_gpu_renderer.c",
                "SDL_gpu_shapes.c",
                "renderer_OpenGL_1_BASE.c",
                "renderer_OpenGL_1.c",
                "renderer_OpenGL_2.c",
                "renderer_OpenGL_3.c",
                "renderer_OpenGL_4.c",
                "renderer_GLES_1.c",
                "renderer_GLES_2.c",
                "renderer_GLES_3.c",
            ],
            cSettings: [
                .headerSearchPath("externals/glew/GL", .when(platforms: [.macOS])),
                .define("GL_GLEXT_PROTOTYPES", .when(platforms: [.android])),
                .define("SDL_GPU_DISABLE_GLES", .when(platforms: [.macOS])),
                .define("GLEW_STATIC", .when(platforms: [.macOS])),
                .define("GLEW_NO_GLU", .when(platforms: [.macOS])),
                .define("SDL_GPU_USE_BUFFER_RESET", .when(platforms: [.macOS])),
                .define("SDL_GPU_DISABLE_OPENGL", .when(platforms: [.android])),
                .define("SDL_GPU_DISABLE_OPENGL_1"),
                .define("SDL_GPU_DISABLE_OPENGL_2"),
                .define("SDL_GPU_DISABLE_GLES_1"),
                .define("SDL_GPU_DISABLE_GLES_2"),
                .define("SDL_DYNAMIC_API", to: "0")
            ],
            linkerSettings: [
                .linkedLibrary("GLESv3", .when(platforms: [.android])),
                .linkedFramework("OpenGL", .when(platforms: [.macOS])),
            ]
        ),
        .target(
            name: "Cstb_image",
            path: "stb_image",
            cSettings: [
                .define("STBI_FAILURE_USERMSG", .when(platforms: [.macOS])),
            ]
        ),
        .target(
            name: "Cglew",
            path: "sdl-gpu/externals/glew",
            sources: ["glew.c"],
            cSettings: [
                .define("GLEW_STATIC"),
                .define("GLEW_NO_GLU"),
            ]
        )
    ]
)
