load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "inference_go_proto",
    srcs = ["batch_op_rewriter.pb.go"],
    importpath = "github.com/wamuir/graft/tensorflow/core/grappler/optimizers/inference_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
        "@org_golang_google_protobuf//types/known/wrapperspb",
    ],
)

alias(
    name = "go_default_library",
    actual = ":inference_go_proto",
    visibility = ["//visibility:public"],
)
