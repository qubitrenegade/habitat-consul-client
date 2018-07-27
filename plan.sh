# This file is the heart of your application's habitat.
# See full docs at https://www.habitat.sh/docs/reference/plan-syntax/
pkg_name=consul-client
pkg_distname=consul
pkg_origin=qbr
pkg_version="1.2.1"
pkg_maintainer="QubitRenegade <qubitrenegade@gmail.com>"
pkg_license=("MPL-2")
pkg_source="https://releases.hashicorp.com/${pkg_distname}/${pkg_version}/${pkg_distname}_${pkg_version}_linux_amd64.zip"
pkg_filename=${pkg_name}-${pkg_version}_linux_amd64.zip
pkg_shasum="e4146334be453146890023303da3e0c815669e108a18fb7d742745df3414a31a"
pkg_deps=(core/bash)
pkg_build_deps=()
pkg_bin_dirs=(bin)
pkg_description=<<EODescription
  Habitat plan for Consul running in "agent" or "client" mode, registering a service.
  (AKA, it registers a service and does not particpate in gossip)

  For usage Instructions, see: https://github.com/qubitrenegade/habitat-consul-client
EODescription
pkg_upstream_url="https://consul.io"

pkg_svc_user="hab"
pkg_svc_group="$pkg_svc_user"

pkg_exports=(
  [client_addr]="client.client_addr"
  [http_port]="ports.http"
  [dns_port]="ports.dns"
)

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
  install -D ${pkg_distname} "${pkg_prefix}/bin/${pkg_distname}"
}
