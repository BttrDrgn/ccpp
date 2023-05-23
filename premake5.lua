workspace "ccpp"
	startproject "ccpp-tester"
	location "./build/"
	targetdir "%{wks.location}/bin/%{cfg.buildcfg}-%{cfg.platform}/"
	objdir "%{wks.location}/obj/%{prj.name}/%{cfg.buildcfg}-%{cfg.platform}/"
	buildlog "%{wks.location}/obj/%{cfg.platform}/%{cfg.buildcfg}-%{prj.name}.log"

	systemversion "latest"
	characterset "ascii"
	warnings "extra"

	flags {
		"multiprocessorcompile",
	}

	platforms {
		"x86",
		"x64",
	}

	configurations {
		"Release",
		"Debug",
	}

	defines {
		"WIN32_LEAN_AND_MEAN",
	}

	filter "platforms:x86"
		architecture "x86"

	filter "platforms:x64"
		architecture "x86_64"

	filter "Release"
		defines "NDEBUG"
		optimize "full"
		runtime "release"
		symbols "off"

	filter "Debug"
		defines "DEBUG"
		optimize "debug"
		runtime "debug"
		symbols "on"

	project "ccpp"
		language "c++"
		cppdialect "c++20"
		kind "staticlib"
		warnings "off"

		dependson {
			"clsocket",
		}

		links {
			"clsocket",
		}

		includedirs {
			"./include",

			"./deps/clsocket/src/",
			"./deps/json/single_include/nlohmann/",
		}

		files {
			"./ccpp.cpp",
			"./include/ccpp.hpp",
		}

	project "ccpp-tester"
		language "c++"
		cppdialect "c++20"
		kind "consoleapp"
		warnings "off"

		dependson {
			"ccpp",
			"clsocket",
		}

		links {
			"ccpp",
			"clsocket",
		}

		includedirs {
			"./src/",
			"./include/",

			"./deps/clsocket/src/",
			"./deps/json/single_include/nlohmann/",
		}

		files {
			"./src/**",
			"./include/**",
		}

	group "Dependencies"
	project "clsocket"
		targetname "clsocket"
		language "c++"
		kind "staticlib"

		links {
			"ws2_32",
			"winmm",
		}
		
		files {
			"./deps/clsocket/src/**",
		}

		includedirs {
			"./deps/clsocket/src/",
		}
