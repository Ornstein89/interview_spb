cmake_minimum_required(VERSION 3.16)

project(2023_09_interview_spb VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core Gui Quick Qml LinguistTools)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(app2023_09_interview_spb
    main.cpp
)

qt_add_qml_module(app2023_09_interview_spb
    URI 2023_09_interview_spb
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES PageCommands.qml
    QML_FILES PageCommandsAdd.qml
    RESOURCES image1.svg
    RESOURCES image2.svg
    QML_FILES Style.qml
    SOURCES modelsaverloader.h modelsaverloader.cpp
    SOURCES translation.h translation.cpp
)

#qt_add_lupdate(app2023_09_interview_spb
#    TS_FILES i18n/ru_RU.ts i18n/en_US.ts
#)

qt_add_translations(app2023_09_interview_spb
    TS_FILES
    i18n/ru_RU.ts
    i18n/en_US.ts
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(app2023_09_interview_spb PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.app2023_09_interview_spb
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(app2023_09_interview_spb
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS app2023_09_interview_spb
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
