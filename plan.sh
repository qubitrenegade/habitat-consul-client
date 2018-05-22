# This file is the heart of your application's habitat.
# See full docs at https://www.habitat.sh/docs/reference/plan-syntax/
pkg_name=consul-client
pkg_distname=consul
pkg_origin=qubitrenegade
pkg_version="1.1.0"
pkg_maintainer="QubitRenegade <qubitrenegade@gmail.com>"
pkg_license=("MPL-2")
pkg_source="https://releases.hashicorp.com/${pkg_distname}/${pkg_version}/${pkg_distname}_${pkg_version}_linux_amd64.zip"
pkg_filename=${pkg_name}-${pkg_version}_linux_amd64.zip
pkg_shasum="09c40c8b5be868003810064916d8460bff334ccfb59a5046390224b27e052c45"
pkg_deps=()
pkg_build_deps=(core/unzip)
pkg_bin_dirs=(bin)
pkg_description="Habitat plan for Consul running in agent or client mode; https://github.com/qubitrenegade/habitat-consul-client"
pkg_upstream_url="https://consul.io"

pkg_svc_user="root"
pkg_svc_group="$pkg_svc_user"

pkg_binds_optional=(
  [consul-server]="port-http"
)

do_unpack() {
  cd "${HAB_CACHE_SRC_PATH}" || exit
  unzip ${pkg_filename} -d "${pkg_name}-${pkg_version}"
}

do_build() {
  return 0
}

do_install() {
  install -D ${pkg_distname} "${pkg_prefix}/bin/${pkg_name}"
}
