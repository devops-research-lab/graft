load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "apis_go_proto",
    srcs = [
        "classification.pb.go",
        "get_model_metadata.pb.go",
        "get_model_status.pb.go",
        "inference.pb.go",
        "input.pb.go",
        "logging.pb.go",
        "model.pb.go",
        "model_management.pb.go",
        "model_service.pb.go",
        "predict.pb.go",
        "prediction_log.pb.go",
        "prediction_service.pb.go",
        "regression.pb.go",
        "session_service.pb.go",
        "status.pb.go",
    ],
    importpath = "github.com/wamuir/graft/tensorflow/serving/apis_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "//tensorflow/core/example/example_protos_go_proto",
        "//tensorflow/core/framework/tensor_go_proto",
        "//tensorflow/core/protobuf/for_core_protos_go_proto",
        "//tensorflow/serving/config_go_proto",
        "//tensorflow/tsl/protobuf/for_core_protos_go_proto",
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
        "@org_golang_google_protobuf//types/known/anypb",
        "@org_golang_google_protobuf//types/known/wrapperspb",
    ],
)

alias(
    name = "go_default_library",
    actual = ":apis_go_proto",
    visibility = ["//visibility:public"],
)
