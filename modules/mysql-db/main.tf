module "cloudsql" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/mysql"
  version = "17.1.0"

  name       = var.name
  project_id = var.project_id

  deletion_protection      = var.deletion_protection
  database_version         = var.database_version
  replica_database_version = var.replica_database_version
  region                   = var.region
  zone                     = var.zone
  secondary_zone           = var.secondary_zone
  tier                     = var.tier
  availability_type        = var.availability_type
  activation_policy        = var.activation_policy
  edition                  = var.edition
  iam_users                = var.iam_users

  user_labels    = merge(var.user_labels, { "${var.instance_role_label_key}" = "master", "${var.instance_name_label_key}" = var.name })
  database_flags = var.database_flags

  disk_size             = var.disk_size
  disk_autoresize_limit = var.disk_autoresize_limit
  disk_type             = var.disk_type

  maintenance_window_day          = local.maintenance_window_day
  maintenance_window_hour         = local.maintenance_window_hour
  maintenance_window_update_track = local.maintenance_window_update_track
  deny_maintenance_period         = var.deny_maintenance_period

  enable_default_db   = false
  enable_default_user = false

  backup_configuration = {
    binary_log_enabled             = true
    enabled                        = true
    start_time                     = null
    location                       = var.backup_location
    point_in_time_recovery_enabled = var.point_in_time_recovery_enabled
    # New options since v6 module release
    transaction_log_retention_days = null # TODO: Add module input
    retained_backups               = null # TODO: Add module input
    retention_unit                 = null # TODO: Add module input
  }

  ip_configuration                 = local.ip_configuration
  insights_config                  = var.insights_config_enabled ? var.insights_config : null
  read_replicas                    = local.read_replicas
  read_replica_name_suffix         = var.read_replica_name_suffix
  read_replica_deletion_protection = var.read_replica_deletion_protection

  module_depends_on   = var.module_depends_on
  encryption_key_name = var.encryption_key_name
}
