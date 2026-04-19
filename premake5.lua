project "rlottie"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "inc/rlottie.h",
        "inc/rlottiecommon.h",
        "src/lottie/**.h",
        "src/lottie/**.cpp",
        "src/vector/**.h",
        "src/vector/**.cpp"
    }

    includedirs
    {
        "inc",
        "src/lottie",
        "src/vector",
        "src/vector/pixman",
        "src/vector/freetype",
        "src" -- This allows #include "config.h" to work
    }

    removefiles
    {
        "src/vector/stb/stb_image.cpp",
        "src/vector/vimageloader.cpp"
    }

    defines
    {
        "RLOTTIE_BUILD",
        "LOTTIE_STATIC",
        "LOTTIE_THREAD_SAFE",
        "HAVE_CONFIG_H" -- This tells the source to use your config.h
    }

    filter "system:windows"
        systemversion "latest"
        defines { "UNICODE", "_UNICODE", "LOTTIE_IMAGE_LOADER" }
        -- Disable noisy warnings that don't affect functionality
        disablewarnings { "4251", "4244", "4267", "4996" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"
        symbols "off"