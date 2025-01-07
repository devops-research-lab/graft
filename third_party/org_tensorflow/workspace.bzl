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
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.17.1/libtensorflow-cpu-linux-x86_64.tar.gz"],
        sha256 = "4a0fdd51f2ab5254b506c1ef5f3c883fc376a44de18ac5ef2b5bf303003c6cf9",
    )

    http_archive(
        name = "libtensorflow_linux_x86_64_gpu",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.17.1/libtensorflow-gpu-linux-x86_64.tar.gz"],
        sha256 = "a96b43868c30faa00ce6e910c6f5078c879d5d3d98c4728fe1aaf2e147a009e2",
    )

    http_archive(
        name = "libtensorflow_macos_arm_64_cpu",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.17.1/libtensorflow-cpu-darwin-arm64.tar.gz"],
        sha256 = "02e055bd102b834b609f604c7072c29789ce93723bfa7bd28727a7adb8e8d812",
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
        strip_prefix = "libtensorflow-proto-2.17.1",
        urls = ["https://github.com/wamuir/libtensorflow-proto/archive/refs/tags/v2.17.1.tar.gz"],
        sha256 = "37935f4560ea76d7f2f8bf1bf1cfe307c7cd7f643f0304727dcd9744d4e8e347",
    )

    http_archive(
        name = "tensorflow_serving_proto",
        build_file = "@graft//third_party/org_tensorflow/tensorflow_serving_proto:tensorflow_serving_proto.BUILD",
        patch_args = ["-p1"],
        patches = [
            "@graft//third_party/org_tensorflow/tensorflow_serving_proto:tensorflow_serving_proto.patch",
        ],
        strip_prefix = "tensorflow-serving-proto-2.17.1",
        urls = ["https://github.com/wamuir/tensorflow-serving-proto/archive/refs/tags/v2.17.1.tar.gz"],
        sha256 = "4061a6c087c22ee411ba53b9b5e8621a3040dc6abcf4fa80bdd2dd1aaf1e5620",
    )

    ###########################################################################
    # base api def
    ###########################################################################

    http_archive(
        name = "tensorflow_base_api_def",
        build_file = "@graft//third_party/org_tensorflow/tensorflow_base_api_def:tensorflow_base_api_def.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "tensorflow-2.17.1/tensorflow/core/api_def/base_api",
        urls = ["https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.17.1.tar.gz"],
        sha256 = "2d3cfb48510f92f3a52fb05b820481c6f066a342a9f5296fe26d72c4ea757700",
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
        strip_prefix = "tensorflow-2.17.1/tensorflow/go",
        urls = ["https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.17.1.tar.gz"],
        sha256 = "2d3cfb48510f92f3a52fb05b820481c6f066a342a9f5296fe26d72c4ea757700",
    )

download_tf_repositories = module_extension(
    implementation = tf_repositories,
)
