load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@libtensorflow_defaults//:config.bzl", "LIBTENSORFLOW_PKG_URL")

def tf_repositories(ctx):
    ###########################################################################
    # libtensorflow
    ###########################################################################

    http_archive(
        name = "libtensorflow_linux_x86_64_cpu",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.18.0/libtensorflow-cpu-linux-x86_64.tar.gz"],
        sha256 = "605bfcb370c7e7ec981eabada880f60784e3de018395be95c95c3e5592c3d9a2",
    )

    http_archive(
        name = "libtensorflow_linux_x86_64_gpu",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.18.0/libtensorflow-gpu-linux-x86_64.tar.gz"],
        sha256 = "6ca25aae03548cf76f6f68f00bdf53ec39710f08cee23bf6419b9e6e27feca5c",
    )

    http_archive(
        name = "libtensorflow_macos_arm_64_cpu",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.18.0/libtensorflow-cpu-darwin-arm64.tar.gz"],
        sha256 = "462257d2792730dcb131fcf21bc826192ae5a2c418535f6347d051f10fc8be8a",
    )

    http_archive(
        name = "libtensorflow_other_build",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        urls = [LIBTENSORFLOW_PKG_URL],
    )

    ###########################################################################
    # protos
    ###########################################################################

    http_archive(
        name = "libtensorflow_proto",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow_proto:libtensorflow_proto.BUILD",
        patch_args = ["-p1"],
        patches = [
            "@graft//third_party/org_tensorflow/libtensorflow_proto:libtensorflow_proto.patch",
            "@graft//third_party/org_tensorflow/libtensorflow_proto:libtensorflow_proto_tsl.patch",
            "@graft//third_party/org_tensorflow/libtensorflow_proto:libtensorflow_proto_xla.patch",
        ],
        strip_prefix = "libtensorflow-proto-2.18.0",
        urls = ["https://github.com/wamuir/libtensorflow-proto/archive/refs/tags/v2.18.0.tar.gz"],
        sha256 = "c9ba218d4bb5cc4cf45c3522515d7797cb3b81a19e14b7429c7e77f4e779ec24",
    )

    http_archive(
        name = "tensorflow_serving_proto",
        build_file = "@graft//third_party/org_tensorflow/tensorflow_serving_proto:tensorflow_serving_proto.BUILD",
        patch_args = ["-p1"],
        patches = [
            "@graft//third_party/org_tensorflow/tensorflow_serving_proto:tensorflow_serving_proto.patch",
        ],
        strip_prefix = "tensorflow-serving-proto-2.18.0",
        urls = ["https://github.com/wamuir/tensorflow-serving-proto/archive/refs/tags/v2.18.0.tar.gz"],
        sha256 = "1c066d479b13c4ab32165704eb3a9134d81b54bf61a87d4b09e6f53aba96149f",
    )

    ###########################################################################
    # base api def
    ###########################################################################

    http_archive(
        name = "tensorflow_base_api_def",
        build_file = "@graft//third_party/org_tensorflow/tensorflow_base_api_def:tensorflow_base_api_def.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "tensorflow-2.18.0/tensorflow/core/api_def/base_api",
        urls = ["https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.18.0.tar.gz"],
        sha256 = "d7876f4bb0235cac60eb6316392a7c48676729860da1ab659fb440379ad5186d",
    )

    ###########################################################################
    # go bindings
    ###########################################################################

    http_archive(
        name = "tensorflow_go",
        build_file = "@graft//third_party/org_tensorflow/tensorflow_go:tensorflow_go.BUILD",
        patch_args = ["-p1"],
        patches = [
            "@graft//third_party/org_tensorflow/tensorflow_go:tensorflow_go_op.patch",
        ],
        strip_prefix = "tensorflow-2.18.0/tensorflow/go",
        urls = ["https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.18.0.tar.gz"],
        sha256 = "d7876f4bb0235cac60eb6316392a7c48676729860da1ab659fb440379ad5186d",
    )

download_tf_repositories = module_extension(
    implementation = tf_repositories,
)
