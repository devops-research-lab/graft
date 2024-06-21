load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "graph_executor_go_proto",
    srcs = ["config.pb.go"],
    importpath = "github.com/wamuir/graft/tensorflow/core/tfrt/graph_executor_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
        "@org_golang_google_protobuf//types/known/anypb",
    ],
)

alias(
    name = "go_default_library",
    actual = ":graph_executor_go_proto",
    visibility = ["//visibility:public"],
)
