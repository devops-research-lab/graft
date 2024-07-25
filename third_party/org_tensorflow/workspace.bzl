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
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.17.0/libtensorflow-cpu-linux-x86_64.tar.gz"],
        sha256 = "a941e18edfaf15dfbb6f32bd3831114b0dd788377c8bdc05cb667d18971c95f2",
    )

    http_archive(
        name = "libtensorflow_linux_x86_64_gpu",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.17.0/libtensorflow-gpu-linux-x86_64.tar.gz"],
        sha256 = "49d0af29b2d2592dce77ef56ebe9d0f1f2d1c3bb17458c9705d0e62e625fa5d2",
    )

    http_archive(
        name = "libtensorflow_macos_arm_64_cpu",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.17.0/libtensorflow-cpu-darwin-arm64.tar.gz"],
        sha256 = "96625cfe219b04f6b0da1ca5bb5120b02f334a8f39f5d6a0628a541e5e62b00c",
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
        ],
        strip_prefix = "libtensorflow-proto-2.17.0",
        urls = ["https://github.com/wamuir/libtensorflow-proto/archive/refs/tags/v2.17.0.tar.gz"],
        sha256 = "4f05b3537a4feaa5564e84243ec43e478585d31e932c9e3f6e75c0526f64d22e",
    )

    http_archive(
        name = "tensorflow_serving_proto",
        build_file = "@graft//third_party/org_tensorflow/tensorflow_serving_proto:tensorflow_serving_proto.BUILD",
        patch_args = ["-p1"],
        patches = [
            "@graft//third_party/org_tensorflow/tensorflow_serving_proto:tensorflow_serving_proto.patch",
        ],
        strip_prefix = "tensorflow-serving-proto-2.17.0",
        urls = ["https://github.com/wamuir/tensorflow-serving-proto/archive/refs/tags/v2.17.0.tar.gz"],
        sha256 = "c2a8de179fb608d26e140032bf3561948fe6496d86e8eb6e22fd2300279d7097",
    )

    ###########################################################################
    # base api def
    ###########################################################################

    http_archive(
        name = "tensorflow_base_api_def",
        build_file = "@graft//third_party/org_tensorflow/tensorflow_base_api_def:tensorflow_base_api_def.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "tensorflow-2.17.0/tensorflow/core/api_def/base_api",
        urls = ["https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.17.0.tar.gz"],
        sha256 = "9cc4d5773b8ee910079baaecb4086d0c28939f024dd74b33fc5e64779b6533dc",
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
        strip_prefix = "tensorflow-2.17.0/tensorflow/go",
        urls = ["https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.17.0.tar.gz"],
        sha256 = "9cc4d5773b8ee910079baaecb4086d0c28939f024dd74b33fc5e64779b6533dc",
    )

download_tf_repositories = module_extension(
    implementation = tf_repositories,
)
