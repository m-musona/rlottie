project "rlottie"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        -- Public Headers
        "inc/rlottie.h",
        "inc/rlottie_capi.h",
        "inc/rlottie_common.h",

        -- Source files
        "src/binding/c/rlottie_capi.cpp",
        
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
        "src/vector/pixman" -- Internal rasterizer
    }

    defines
    {
        "RLOTTIE_BUILD",
        "LOTTIE_STATIC",
        "_CRT_SECURE_NO_WARNINGS"
    }

    filter "system:windows"
        systemversion "latest"
        defines { "UNICODE", "_UNICODE" }

    filter "system:macosx"
        buildoptions { "-fvisibility=hidden" }

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