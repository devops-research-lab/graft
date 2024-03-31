load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@libtensorflow_defaults//:config.bzl", "LIBTENSORFLOW_PKG_URL")

def tf_repositories(ctx):
    ###########################################################################
    # libtensorflow
    ###########################################################################

    http_archive(
        name = "libtensorflow_linux_x86_64_cpu",
        build_file = "@com_github_wamuir_graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.16.1/libtensorflow-cpu-linux-x86_64.tar.gz"],
        sha256 = "d72c7e773ed64fb0e6d728f4bcf1f26f3e5c4420e9cbe42c78e29e45b622fac6",
    )

    http_archive(
        name = "libtensorflow_linux_x86_64_gpu",
        build_file = "@com_github_wamuir_graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.16.1/libtensorflow-gpu-linux-x86_64.tar.gz"],
        sha256 = "cdf3632c80b90e6fbde3a4248705fab63e92cd5b83fc3973f3b2f9988b1f4e3c",
    )

    http_archive(
        name = "libtensorflow_macos_x86_64_cpu",
        build_file = "@com_github_wamuir_graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.16.1/libtensorflow-cpu-darwin-x86_64.tar.gz"],
        sha256 = "20a0965bc9843a20266824de9158cb463a5e2b6c5cf0f0ebecc2f135c2def679",
    )

    http_archive(
        name = "libtensorflow_macos_arm_64_cpu",
        build_file = "@com_github_wamuir_graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "",
        urls = ["https://storage.googleapis.com/tensorflow/versions/2.16.1/libtensorflow-cpu-darwin-arm64.tar.gz"],
        sha256 = "28a0b94a9e8aecacc9485aa056270337fbefb01d0e43383c515db6ad76d1a14f",
    )

    http_archive(
        name = "libtensorflow_other_build",
        build_file = "@com_github_wamuir_graft//third_party/org_tensorflow/libtensorflow:libtensorflow.BUILD",
        urls = [LIBTENSORFLOW_PKG_URL],
    )

    ###########################################################################
    # protos
    ###########################################################################

    http_archive(
        name = "libtensorflow_proto",
        build_file = "@com_github_wamuir_graft//third_party/org_tensorflow/libtensorflow_proto:libtensorflow_proto.BUILD",
        patch_args = ["-p1"],
        patches = [
            "@com_github_wamuir_graft//third_party/org_tensorflow/libtensorflow_proto:libtensorflow_proto.patch",
            "@com_github_wamuir_graft//third_party/org_tensorflow/libtensorflow_proto:libtensorflow_proto_tsl.patch",
        ],
        strip_prefix = "libtensorflow-proto-2.16.1",
        urls = ["https://github.com/wamuir/libtensorflow-proto/archive/refs/tags/v2.16.1.tar.gz"],
        sha256 = "7020ecc3092a5f2b40455a5a702cada1b065c703d87d50645eb7713a2ca756ef",
    )

    ###########################################################################
    # base api def
    ###########################################################################

    http_archive(
        name = "tensorflow_base_api_def",
        build_file = "@com_github_wamuir_graft//third_party/org_tensorflow/tensorflow_base_api_def:tensorflow_base_api_def.BUILD",
        patch_args = ["-p1"],
        patches = [],
        strip_prefix = "tensorflow-2.16.1/tensorflow/core/api_def/base_api",
        urls = ["https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.16.1.tar.gz"],
        sha256 = "c729e56efc945c6df08efe5c9f5b8b89329c7c91b8f40ad2bb3e13900bd4876d",
    )

    ###########################################################################
    # go bindings
    ###########################################################################

    http_archive(
        name = "tensorflow_go",
        build_file = "@com_github_wamuir_graft//third_party/org_tensorflow/tensorflow_go:tensorflow_go.BUILD",
        patch_args = ["-p1"],
        patches = [
            "@com_github_wamuir_graft//third_party/org_tensorflow/tensorflow_go:tensorflow_go_op.patch",
        ],
        strip_prefix = "tensorflow-2.16.1/tensorflow/go",
        urls = ["https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.16.1.tar.gz"],
        sha256 = "c729e56efc945c6df08efe5c9f5b8b89329c7c91b8f40ad2bb3e13900bd4876d",
    )

download_tf_repositories = module_extension(
    implementation = tf_repositories,
)
