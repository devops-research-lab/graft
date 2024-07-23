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
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.16.2/libtensorflow-cpu-linux-x86_64.tar.gz"],
        sha256 = "bd7d4ccb25ef2798076ebc88e9fdbeaa08ffea57996813403bba5c69d219c2ad",
    )

    http_archive(
        name = "libtensorflow_linux_x86_64_gpu",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.16.2/libtensorflow-gpu-linux-x86_64.tar.gz"],
        sha256 = "9fad02da55d860589aaf750eeea78a5cd5ad7f35340f56cdafed9c50af31b817",
    )

    http_archive(
        name = "libtensorflow_macos_x86_64_cpu",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.16.2/libtensorflow-cpu-darwin-x86_64.tar.gz"],
        sha256 = "26b17967afbe99ef89c16f59b366d62b14c55c5c583af6e70aed8c3b3147ee9f",
    )

    http_archive(
        name = "libtensorflow_macos_arm_64_cpu",
        build_file = "@graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.16.2/libtensorflow-cpu-darwin-arm64.tar.gz"],
        sha256 = "706f3b35e204e4d1b2c971e11bde1267d62cd02b56f2987a4afde160d441558c",
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
        strip_prefix = "libtensorflow-proto-2.16.2",
        urls = ["https://github.com/wamuir/libtensorflow-proto/archive/refs/tags/v2.16.2.tar.gz"],
        sha256 = "44cd645e63104029248a8ce8204b8ae7f297d897d5604a7d1a20eff71852dfad",
    )

    ###########################################################################
    # base api def
    ###########################################################################

    http_archive(
        name = "tensorflow_base_api_def",
        build_file = "@graft//third_party/org_tensorflow/tensorflow_base_api_def:tensorflow_base_api_def.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "tensorflow-2.16.2/tensorflow/core/api_def/base_api",
        urls = ["https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.16.2.tar.gz"],
        sha256 = "023849bf253080cb1e4f09386f5eb900492da2288274086ed6cfecd6d99da9eb",
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
        strip_prefix = "tensorflow-2.16.2/tensorflow/go",
        urls = ["https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.16.2.tar.gz"],
        sha256 = "023849bf253080cb1e4f09386f5eb900492da2288274086ed6cfecd6d99da9eb",
    )

download_tf_repositories = module_extension(
    implementation = tf_repositories,
)
