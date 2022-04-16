package("qtjsonserializer")
    set_description("The qtjsonserializer package, brutally mutilated to build with xmake")

    add_urls("https://github.com/ohmree/QtJsonSerializer.git")
    add_versions("4.0.3", "9cd77fc46c3b36b1155d08b4ee0fc9efaa739fe4")

    on_install(function (package)
        print(import("detect.tools.find_qmake")())

        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        local qt = assert(import("detect.sdks.find_qt")(), "qt not found!")
        local qtcore_includedir = path.join(qt.includedir, "QtCore")

        assert(package:has_cxxtypes(
                   "QtJsonSerializer::SerializerBase",
                   {includes = "QtJsonSerializer/serializerbase.h",
                    configs = {includedirs = {qt.includedir, qtcore_includedir},
                               links = "Qt5Core",
                               languages = "c++17",
                               cxxflags = {"-fPIC"}}}
        ))
    end)
package_end()
