# == Class: rsnapshot
#
# Full description of class rsnapshot here.
#
class rsnapshot(
  Stdlib::Host $fqdn = $::fqdn,
  Optional[Hash[Stdlib::Host,Hash]] $servers = {},
  Optional[Hash[Stdlib::Host,Hash]] $clients = {},
) {
  # Decide on the mode: no hiera config for us? -> puppetmaster as before
  if $servers.length < 1 and $clients.length < 1 {
    $mode = 'puppetmaster'
    include ::rsnapshot::mode::puppetmaster
  } else {
    $mode = 'masterless'
    include ::rsnapshot::mode::masterless
  }
}
