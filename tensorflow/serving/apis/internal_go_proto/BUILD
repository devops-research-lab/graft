load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "internal_go_proto",
    srcs = ["serialized_input.pb.go"],
    importpath = "github.com/wamuir/graft/tensorflow/serving/apis/internal_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
    ],
)

alias(
    name = "go_default_library",
    actual = ":internal_go_proto",
    visibility = ["//visibility:public"],
)
