load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "storage_path_go_proto",
    srcs = ["static_storage_path_source.pb.go"],
    importpath = "github.com/wamuir/graft/tensorflow/serving/sources/storage_path_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
    ],
)

alias(
    name = "go_default_library",
    actual = ":storage_path_go_proto",
    visibility = ["//visibility:public"],
)
