load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "test_util_go_proto",
    srcs = ["fake_loader_source_adapter.pb.go"],
    importpath = "github.com/wamuir/graft/tensorflow/serving/core/test_util_go_proto",
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
