load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "tensorflow_go_proto",
    srcs = [
        "remote_op_config_rewriter.pb.go",
        "saved_model_bundle_source_adapter.pb.go",
        "saved_model_config.pb.go",
        "session_bundle_config.pb.go",
        "tfrt_saved_model_source_adapter.pb.go",
        "thread_pool_factory_config.pb.go",
    ],
    importpath = "github.com/wamuir/graft/tensorflow/serving/servables/tensorflow_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "//tensorflow/core/grappler/optimizers/inference_go_proto",
        "//tensorflow/core/protobuf/for_core_protos_go_proto",
        "//tensorflow/core/tfrt/graph_executor_go_proto",
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
        "@org_golang_google_protobuf//types/known/anypb",
        "@org_golang_google_protobuf//types/known/wrapperspb",
    ],
)

alias(
    name = "go_default_library",
    actual = ":tensorflow_go_proto",
    visibility = ["//visibility:public"],
)
