load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "oss_go_proto",
    srcs = ["manifest.pb.go"],
    importpath = "github.com/wamuir/graft/tensorflow/serving/session_bundle/oss_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
    ],
)

alias(
    name = "go_default_library",
    actual = ":oss_go_proto",
    visibility = ["//visibility:public"],
)
