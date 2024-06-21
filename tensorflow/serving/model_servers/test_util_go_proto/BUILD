load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "test_util_go_proto",
    srcs = ["storage_path_error_injecting_source_adapter.pb.go"],
    importpath = "github.com/wamuir/graft/tensorflow/serving/model_servers/test_util_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
    ],
)

alias(
    name = "go_default_library",
    actual = ":test_util_go_proto",
    visibility = ["//visibility:public"],
)
