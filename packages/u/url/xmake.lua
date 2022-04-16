package("url")

    set_homepage("https://github.com/CPPAlliance/url")
    set_description("Boost.URL is a library for manipulating Uniform Resource Identifiers (URIs) and Locators (URLs).")

    add_urls("https://github.com/CPPAlliance/url.git")

    on_install(function (package)
        os.cp("include/boost", package:installdir("include"))
    end)

    -- TODO: write test.
    -- on_test(function (package)
    --     assert(package:check_cxxsnippets({test = [[
    --         static void test() {
    --             cxxopts::Options options("MyProgram", "One line description of MyProgram");
    --             options.add_options()
    --               ("d,debug", "Enable debugging") // a bool parameter
    --               ("i,integer", "Int param", cxxopts::value<int>())
    --               ("f,file", "File name", cxxopts::value<std::string>())
    --               ("v,verbose", "Verbose output", cxxopts::value<bool>()->default_value("false"));
    --         }
    --     ]]}, {configs = {languages = "c++11"}, includes = "cxxopts.hpp"}))
    -- end)
