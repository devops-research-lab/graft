load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "resources_go_proto",
    srcs = ["resources.pb.go"],
    importpath = "github.com/wamuir/graft/tensorflow/serving/resources_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
        "@org_golang_google_protobuf//types/known/wrapperspb",
    ],
)

alias(
    name = "go_default_library",
    actual = ":resources_go_proto",
    visibility = ["//visibility:public"],
)
