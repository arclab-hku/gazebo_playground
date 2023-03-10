cmake_minimum_required(VERSION 3.10.0)
project(gazebo_sim)

ADD_COMPILE_OPTIONS(-std=c++14 )
ADD_COMPILE_OPTIONS(-std=c++14 )
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -Wall -g")
set(CMAKE_BUILD_TYPE "Release")
#set(CMAKE_PREFIX_PATH "/usr/lib/x86_64-linux-gnu/cmake/gazebo/")
set(gazebo_DIR "/usr/lib/x86_64-linux-gnu/cmake/gazebo/")
#set(CMAKE_CXX_FLAGS_RELEASE "-O3 -Wall -fPIC")
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_LIST_DIR}/../cmake)
## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(OpenCV REQUIRED)
find_package(Eigen3 REQUIRED)
find_package(PCL 1.7 REQUIRED)
find_package(Boost REQUIRED COMPONENTS system filesystem)
#find_package(Boost REQUIRED COMPONENTS system filesystem)
find_package(catkin REQUIRED COMPONENTS
  roscpp
  gazebo REQUIRED
  rospy
  std_msgs
  visualization_msgs
  pcl_conversions
  pcl_ros
  roscpp
  cv_bridge
  sensor_msgs
  control_msgs
  gazebo_msgs
  gazebo_plugins
  geometry_msgs
  nav_msgs
  roslib
  std_srvs
  sensor_msgs
  # decomp_ros_utils
)

  catkin_package(
 #   INCLUDE_DIRS include
    INCLUDE_DIRS src
    DEPENDS OpenCV Eigen Boost
    DEPENDS
    roscpp
    gazebo_ros
    # image_transport
    # camera_info_manager
    sensor_msgs
  )

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
    include
    SYSTEM 
    ${catkin_INCLUDE_DIRS} 
    ${PROJECT_SOURCE_DIR}/include
    ${GAZEBO_INCLUDE_DIRS}
  ${CMAKE_CURRENT_SOURCE_DIR}
    ${Eigen3_INCLUDE_DIRS} 
    ${EIGEN3_INCLUDE_DIRS}
    ${PCL_INCLUDE_DIRS}
    ${OCTOMAP_INCLUDE_DIRS}
    ${DECOMP_UTIL_INCLUDE_DIRS}
    ${CURSES_INCLUDE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/src
  )

link_directories(${GAZEBO_LIBRARY_DIRS})

add_library(realsense_gazebo_plugin
    src/RealSensePlugin.cpp
    src/gazebo_ros_realsense.cpp
    )

target_link_libraries(realsense_gazebo_plugin
    ${catkin_LIBRARIES}
    ${GAZEBO_LIBRARIES})
add_dependencies(realsense_gazebo_plugin
    ${catkin_EXPORTED_TARGETS})
