CMAKE_MINIMUM_REQUIRED(VERSION 2.8.3)
PROJECT(wave_odometry)

SET(CMAKE_BUILD_TYPE RELEASE)

# PACKAGES
FIND_PACKAGE(PCL REQUIRED)
FIND_PACKAGE(Ceres REQUIRED)

# INCLUDES
INCLUDE_DIRECTORIES(
    include
    /usr/include/eigen3
    ${CERES_INCLUDE_DIRS}
    ${PCL_INCLUDE_DIRS})

# LIBRARY
ADD_LIBRARY(
    wave_odometry
    STATIC
    src/LaserOdom.cpp
)

LINK_DIRECTORIES(
    ${PCL_LIBRARY_DIRS})

# UNIT TESTS
WAVE_ADD_TEST(${PROJECT_NAME}_tests
        tests/laserodom_tests.cpp)
TARGET_LINK_LIBRARIES(
    ${PROJECT_NAME}_tests
    ${PROJECT_NAME}
    wave_utils
    wave_matching
    ${CERES_LIBRARIES}
    ${PCL_LIBRARIES}
)

# Copy the test data
file(COPY tests/data DESTINATION ${PROJECT_BINARY_DIR}/tests)