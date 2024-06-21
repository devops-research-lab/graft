load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "util_go_proto",
    srcs = ["class_registration_test.pb.go"],
    importpath = "github.com/wamuir/graft/tensorflow/serving/util_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
        "@org_golang_google_protobuf//types/known/anypb",
    ],
)

alias(
    name = "go_default_library",
    actual = ":util_go_proto",
    visibility = ["//visibility:public"],
)
