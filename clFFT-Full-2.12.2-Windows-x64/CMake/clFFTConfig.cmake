include(${CMAKE_CURRENT_LIST_DIR}/clFFTTargets.cmake)
get_filename_component(CLFFT_INCLUDE_DIRS ${CMAKE_CURRENT_LIST_DIR}/../include ABSOLUTE)
set(CLFFT_LIBRARIES clFFT)
