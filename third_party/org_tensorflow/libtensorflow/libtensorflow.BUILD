load("@graft//third_party/org_tensorflow:version.bzl", "VERSION_MAJOR")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

package(
    default_visibility = ["//visibility:private"],
)

ALL_FILES = glob(
    ["**/*"],
    exclude = [
        "BUILD.bazel",
        "WORKSPACE",
    ],
)

C_HEADERS = [f.replace("include/external/local_tsl/tsl", "include/tsl") for f in glob(["include/**/*.h"], allow_empty = True)]

genrule(
    name = "repath_tsl_headers",
    srcs = glob(["include/external/local_tsl/tsl/**/*.h"], allow_empty = True),
    outs = [f.replace("include/external/local_tsl/tsl", "include/tsl") for f in glob(["include/external/local_tsl/tsl/**/*.h"], allow_empty = True)],
    cmd = "\n".join(["mkdir -p $$(dirname $(location %s)) && cp $(location %s) $(location :%s)" % (
        f,
        f,
        f.replace("include/external/local_tsl/tsl", "include/tsl"),
    ) for f in glob(["include/external/local_tsl/tsl/**/*.h"], allow_empty = True)]),
)

# exclude symlinks (symlinks not preserved by rule_pkg)
# github.com/bazelbuild/rules_pkg/issues/115
PKG_FILES = C_HEADERS + glob(
    ["**/*"],
    exclude = [
        "BUILD.bazel",
        "WORKSPACE",
        "include/**/*.h",
        "lib/libtensorflow.dylib",
        "lib/libtensorflow.%s.dylib" % VERSION_MAJOR,
        "lib/libtensorflow_framework.dylib",
        "lib/libtensorflow_framework.%s.dylib" % VERSION_MAJOR,
        "lib/libtensorflow.so",
        "lib/libtensorflow.so.%s" % VERSION_MAJOR,
        "lib/libtensorflow_framework.so",
        "lib/libtensorflow_framework.so.%s" % VERSION_MAJOR,
    ],
)

filegroup(
    name = "all_files",
    srcs = ALL_FILES,
    visibility = ["@graft//third_party/org_tensorflow:__pkg__"],
)

filegroup(
    name = "pkg_files",
    srcs = PKG_FILES,
    visibility = ["@graft//third_party/org_tensorflow:__pkg__"],
)

filegroup(
    name = "c_headers",
    srcs = C_HEADERS,
    visibility = ["@graft//third_party/org_tensorflow:__pkg__"],
)

cc_import(
    name = "libtensorflow_import_lib",
    shared_library = select({
        "@platforms//os:linux": "lib/libtensorflow.so.%s" % VERSION_MAJOR,
        "@platforms//os:macos": "lib/libtensorflow.%s.dylib" % VERSION_MAJOR,
    }),
    visibility = ["@graft//third_party/org_tensorflow:__pkg__"],
)

cc_import(
    name = "libtensorflow_framework_import_lib",
    shared_library = select({
        "@platforms//os:linux": "lib/libtensorflow_framework.so.%s" % VERSION_MAJOR,
        "@platforms//os:macos": "lib/libtensorflow_framework.%s.dylib" % VERSION_MAJOR,
    }),
    visibility = ["@graft//third_party/org_tensorflow:__pkg__"],
)

cc_library(
    name = "libtensorflow",
    hdrs = C_HEADERS,
    includes = ["include"],
    visibility = ["@graft//third_party/org_tensorflow:__pkg__"],
    deps = [
        ":libtensorflow_framework_import_lib",
        ":libtensorflow_import_lib",
    ],
)
