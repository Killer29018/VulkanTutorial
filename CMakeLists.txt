cmake_minimum_required(VERSION 3.18)
set (CMAKE_EXPORT_COMPILE_COMMANDS ON)

project (VulkanTutorial)

find_package(Vulkan REQUIRED)

set (CMAKE_CXX_STANDARD 20)

set (linkerFlags "")

if (WIN32)
    set (linkerFlags "-limm32 -luser32")
elseif (UNIX)
endif()

# Change the output directory
set (binaryDir "/bin")
set (outputDirectory "${PROJECT_SOURCE_DIR}${binaryDir}")

if (CMAKE_BUILD_TYPE MATCHES Debug)
    message ("Debug Build")
    set (outputDirectory "${outputDirectory}/debug")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")
elseif (CMAKE_BUILD_TYPE MATCHES Release)
    message ("Release Build")
    set (outputDirectory "${outputDirectory}/release")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
endif ()

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${outputDirectory})

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++2a -O2 -Wall -Wextra -Wpedantic \
    -Wno-unused-parameter -Wno-unknown-pragmas -Wno-unused-variable")

file (GLOB_RECURSE projectFiles CONFIGURE_DEPENDS "src/*.cpp" "src/*.hpp")
add_executable(${PROJECT_NAME} ${projectFiles})

add_subdirectory(vendor)

target_include_directories(${PROJECT_NAME} 
    PUBLIC
        ${Vulkan_INCLUDE_DIR}
    )

# target_link_directories(${PROJECT_NAME} PRIVATE "-L${Vulkan_LIBRARY}")

target_link_libraries(${PROJECT_NAME} 
    PRIVATE 
        ${LINKER}
    PUBLIC
        glm::glm
        glfw
        Vulkan::Vulkan
    )

