class rsnapshot::mode::masterless {
  # configure this machine if it is listed as a server
  if $rsnapshot::fqdn in $rsnapshot::servers {
    # declare all rsnapshot client configurations for our server
    ensure_resources('rsnapshot::server::config', $rsnapshot::clients)
    # create the rsnapshot server
    create_resources('class', { 'rsnapshot::server' => $rsnapshot::servers[$rsnapshot::fqdn] })
  }

  # configure this machine if it is listed as a client
  if $rsnapshot::fqdn in $rsnapshot::clients {
    create_resources('class', { 'rsnapshot::client' => $rsnapshot::clients[$rsnapshot::fqdn] })
  }

}