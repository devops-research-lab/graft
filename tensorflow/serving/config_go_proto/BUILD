load("@rules_go//go:def.bzl", "go_library")

go_library(
    name = "config_go_proto",
    srcs = [
        "file_system_storage_path_source.pb.go",
        "log_collector_config.pb.go",
        "logging_config.pb.go",
        "model_server_config.pb.go",
        "monitoring_config.pb.go",
        "platform_config.pb.go",
        "ssl_config.pb.go",
    ],
    importpath = "github.com/wamuir/graft/tensorflow/serving/config_go_proto",
    visibility = ["//visibility:public"],
    deps = [
        "@org_golang_google_protobuf//reflect/protoreflect",
        "@org_golang_google_protobuf//runtime/protoimpl",
        "@org_golang_google_protobuf//types/known/anypb",
    ],
)

alias(
    name = "go_default_library",
    actual = ":config_go_proto",
    visibility = ["//visibility:public"],
)
