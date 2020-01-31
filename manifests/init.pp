# == Class: rsnapshot
#
# Full description of class rsnapshot here.
#
class rsnapshot(
  Stdlib::Host $fqdn = $::fqdn,
  Optional[Hash[String,Hash]] $servers = {},
  Optional[Hash[String,Hash]] $clients = {},
) {
  # configure this machine if it is listed as a server
  if $fqdn in $servers {
    create_resources('class', { 'rsnapshot::server' => $servers[$fqdn] })
  }

  # configure this machine if it is listed as a client
  if $fqdn in $clients {
    ensure_resource('rsnapshot::client', $fqdn, $clients[$fqdn])
  }
}
