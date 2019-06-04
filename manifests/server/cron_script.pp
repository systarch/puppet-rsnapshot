class rsnapshot::server::cron_script (
  $script_path = $rsnapshot::params::script_path,
){

  file { $script_path:
    ensure => directory,
    group  => root,
    mode   => '0755',
    owner  => root,
  }

file { "$script_path/rsnapshot_backup.sh":
  ensure  => present,
  group   => root,
  mode    => '0544',
  owner   => root,
  require => File[$script_path]
  source  => 'puppet:///modules/rsnapshot/rsnapshot_backup.sh'
}

  # cronjobs

  ## hourly
#  if ($retain_hourly > 0) {
#    cron { "rsnapshot-${name}-hourly" :
#      command => "${rsnapshot::server::cmd_rsnapshot} -c ${config_file} hourly",
#      user    => $server_user,
#      hour    => $backup_hourly_cron,
#      minute  => $backup_time_minute
#    }
#  }

  ## daily
#  if ($retain_daily > 0) {
#    cron { "rsnapshot-${name}-daily" :
#      command => "${rsnapshot::server::cmd_rsnapshot} -c ${config_file} daily",
#      user    => $server_user,
#      hour    => $backup_time_hour,
#      minute  => ($backup_time_minute + 50) % 60
#    }
#  }

  ## weekly
#  if ($retain_weekly > 0) {
#    cron { "rsnapshot-${name}-weekly" :
#      command => "${rsnapshot::server::cmd_rsnapshot} -c ${config_file} weekly",
#      user    => $server_user,
#      hour    => ($backup_time_hour + 3) % 24,
#      minute  => ($backup_time_minute + 50) % 60,
#      weekday => $backup_time_weekday
#    }
#  }

  ## monthly
#  if ($retain_monthly > 0) {
#    cron { "rsnapshot-${name}-monthly" :
#      command  => "${rsnapshot::server::cmd_rsnapshot} -c ${config_file} monthly",
#      user     => $server_user,
#      hour     => ($backup_time_hour + 7) % 24,
#      minute   => ($backup_time_minute + 50) % 60,
#      monthday => $backup_time_dom
#    }
#  }
}
