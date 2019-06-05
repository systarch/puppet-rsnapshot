# Class: rsnapshot::params
#
# This class manages parameters for the rsnapshot module
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class rsnapshot::params {
  $backup_hourly_cron     = '*/2'
  $backup_time_dom        = 15
  $backup_time_hour       = fqdn_rand(23, 'rsnapshot_hour')
  $backup_time_minute     = fqdn_rand(59, 'rsnapshot_minute')
  $backup_time_weekday    = 6
  $client_packages        = [ 'rsync' ]
  $client_user            = 'backshots'
  $cmd_postexec           = undef
  $cmd_preexec            = undef
  $du_args                = '-csh'
  $link_dest              = 1
  $log_level              = 5
  $no_create_root         = 0
  $one_fs                 = undef
  $push_ssh_key           = true
  $retain_daily           = 7
  $retain_hourly          = 6
  $retain_monthly         = 3
  $retain_weekly          = 4
  $rsync_long_args        = '--delete --numeric-ids --relative --delete-excluded'
  $rsync_numtries         = 2
  $rsync_short_args       = '-a'
  $server_backup_path     = '/backups'
  $server_config_path     = '/etc/rsnapshot'
  $server_log_path        = '/var/log/rsnapshot'
  $server_packages        = [ 'rsnapshot' ]
  $server_user            = 'root'
  $setup_sudo             = true
  $ssh_args               = undef
  $stop_on_stale_lockfile = 0
  $sync_first             = 0
  $use_lazy_deletes       = 0
  $use_sudo               = true
  $verbose                = 2
  $wrapper_path           = '/opt/rsnapshot_wrappers/'
  $wrapper_rsync_sender   = 'rsync_sender.sh'
  $wrapper_rsync_ssh      = 'rsync_ssh.sh'
  $wrapper_sudo           = 'rsync_sudo.sh'

  case $::osfamily {
    debian: {
      $cmd_rsnapshot = '/usr/bin/rsnapshot'
      $cmd_cp = '/bin/cp'
      $cmd_rm = '/bin/rm'
      $cmd_rsync = '/usr/bin/rsync'
      $cmd_client_rsync = '/usr/bin/rsync'
      $cmd_client_sudo = '/usr/bin/sudo'
      $cmd_ssh = '/usr/bin/ssh'
      $cmd_logger = '/usr/bin/logger'
      $cmd_du = '/usr/bin/du'
      $cmd_rsnapshot_diff = undef
      $linux_lvm_cmd_lvcreate = undef
      $linux_lvm_cmd_lvremove = undef
      $linux_lvm_cmd_mount = '/bin/mount'
      $linux_lvm_cmd_umount = '/bin/umount'
      $lock_path = '/var/run/'
      $log_path = '/var/log/'
    }
    default: {
      $cmd_rsnapshot = '/usr/local/bin/rsnapshot'
      $cmd_cp = undef
      $cmd_rm = undef
      $cmd_rsync = '/usr/bin/rsync'
      $cmd_client_rsync = '/usr/bin/rsync'
      $cmd_client_sudo = '/usr/bin/sudo'
      $cmd_ssh = undef
      $cmd_logger = undef
      $cmd_du = undef
      $cmd_rsnapshot_diff = undef
      $linux_lvm_cmd_lvcreate = undef
      $linux_lvm_cmd_lvremove = undef
      $linux_lvm_cmd_mount = undef
      $linux_lvm_cmd_umount = undef
      $lock_path = '/var/run/'
      $log_path = '/var/log/'
    }
  }

}
