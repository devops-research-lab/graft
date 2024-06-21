load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "hashmap_go_proto",
    srcs = ["hashmap_source_adapter.pb.go"],
    importpath = "github.com/wamuir/graft/tensorflow/serving/servables/hashmap_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
    ],
)

alias(
    name = "go_default_library",
    actual = ":hashmap_go_proto",
    visibility = ["//visibility:public"],
)
