variable "project_id" {
  description = "The project ID to manage the Cloud SQL resources"
  type        = string
}

variable "name" {
  type        = string
  description = "The name of the Cloud SQL resources"
}

variable "replica_database_version" {
  description = "The read replica database version to use. This var should only be used during a database update. The update sequence 1. read-replica 2. master, setting this to an updated version will cause the replica to update, then you may update the master with the var database_version and remove this field after update is complete"
  type        = string
  default     = ""
}

variable "database_version" {
  description = "The database version to use"
  type        = string
  default     = "MYSQL_5_7"
}

variable "region" {
  description = "The region of the Cloud SQL resources"
  type        = string
  default     = "europe-west2"
}

// Master
variable "tier" {
  description = "The tier for the master instance."
  type        = string
  default     = "db-n1-standard-1"
}

variable "zone" {
  description = "The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`."
  type        = string
  default     = "europe-west2-c"
}

variable "secondary_zone" {
  type        = string
  description = "The preferred zone for the secondary/failover instance, it should be something like: `us-central1-a`, `us-east1-c`."
  default     = null
}

variable "activation_policy" {
  description = "The activation policy for the master instance. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
  type        = string
  default     = "ALWAYS"
}

variable "availability_type" {
  description = "The availability type for the master instance. Can be either `REGIONAL` or `null`."
  type        = string
  default     = "REGIONAL"
}

variable "disk_autoresize" {
  description = "Configuration to increase storage size"
  type        = bool
  default     = true
}

variable "disk_autoresize_limit" {
  description = "The maximum size to which storage can be auto increased."
  type        = number
  default     = 0
}

variable "disk_size" {
  description = "The disk size for the master instance"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}

variable "pricing_plan" {
  description = "The pricing plan for the master instance."
  type        = string
  default     = "PER_USE"
}

variable "maintenance_window_day" {
  description = "The day of week (1-7) for the master instance maintenance."
  type        = number
  default     = 1
}

variable "maintenance_window_hour" {
  description = "The hour of day (0-23) maintenance window for the master instance maintenance."
  type        = number
  default     = 6
}

variable "maintenance_window_update_track" {
  description = "The update track of maintenance window for the master instance maintenance. Can be either `canary` or `stable`."
  type        = string
  default     = "canary"
}

variable "database_flags" {
  description = "List of Cloud SQL flags that are applied to the database server. See [more details](https://cloud.google.com/sql/docs/mysql/flags)"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "user_labels" {
  type        = map(string)
  default     = {}
  description = "The key/value labels for the master instances."
}

variable "point_in_time_recovery_enabled" {
  type        = bool
  description = "Enable Point In Time Recovery"
  default     = false
}

variable "backup_location" {
  type        = string
  description = "Instance Backup location"
  default     = null
}

variable "insights_config_enabled" {
  type        = bool
  description = "Enable Insights Config"
  default     = true
}

variable "insights_config" {
  description = "The insights_config settings for the database."
  type = object({
    query_plans_per_minute  = number
    query_string_length     = number
    record_application_tags = bool
    record_client_address   = bool
  })
  default = {
    query_plans_per_minute  = null
    query_string_length     = null
    record_application_tags = null
    record_client_address   = null
  }
}

variable "ip_configuration" {
  description = "The ip_configuration settings subblock"
  type = object({
    authorized_networks = list(map(string))
    ipv4_enabled        = bool
    private_network     = string
    require_ssl         = bool
    allocated_ip_range  = string
  })
  default = {
    authorized_networks = []
    ipv4_enabled        = true
    private_network     = null
    require_ssl         = null
    allocated_ip_range  = null
  }
}

variable "authorized_networks" {
  type        = list(map(string))
  description = "Networks to authorise."
  default     = []
}

variable "private_network" {
  type        = bool
  description = "Enable Private IP"
  default     = true
}

variable "ipv4_enabled" {
  type        = bool
  description = "Enable Public IPv4 access"
  default     = false
}

variable "require_ssl" {
  type        = bool
  description = "Requre SSL for connections"
  default     = true
}

variable "vpc_project" {
  type        = string
  description = "The ID of the global vpc project."
}

variable "vpc_network" {
  type        = string
  description = "Name of the service network"
}


// Read Replicas
variable "read_replicas" {
  description = "List of read replicas to create"
  type = list(object({
    name                  = string
    tier                  = string
    zone                  = string
    availability_type     = string
    disk_type             = string
    disk_autoresize       = bool
    disk_autoresize_limit = number

    disk_size   = string
    user_labels = map(string)
    database_flags = list(object({
      name  = string
      value = string
    }))
  }))
  default = []
}

variable "read_replica_name_suffix" {
  description = "The optional suffix to add to the read instance name"
  type        = string
  default     = ""
}

variable "create_timeout" {
  description = "The optional timout that is applied to limit long database creates."
  type        = string
  default     = "10m"
}

variable "update_timeout" {
  description = "The optional timout that is applied to limit long database updates."
  type        = string
  default     = "10m"
}

variable "delete_timeout" {
  description = "The optional timout that is applied to limit long database deletes."
  type        = string
  default     = "10m"
}

variable "encryption_key_name" {
  description = "The full path to the encryption key used for the CMEK disk encryption"
  type        = string
  default     = null
}

variable "module_depends_on" {
  description = "List of modules or resources this module depends on."
  type        = list(any)
  default     = []
}

variable "deletion_protection" {
  description = "Used to block Terraform from deleting a SQL Instance."
  type        = bool
  default     = true
}

variable "read_replica_deletion_protection" {
  description = "Used to block Terraform from deleting replica SQL Instances."
  type        = bool
  default     = false
}

variable "read_replica_ipv4_enabled" {
  description = "Enable public IPv4 access on replica"
  type        = bool
  default     = false
}

variable "maintenance_window_prod" {
  description = "Set Maintenance Window to prod values"
  type        = bool
  default     = true
}

variable "instance_role_label_key" {
  description = "Label key used to track master/replicas for billing"
  type        = string
  default     = "instance_role"
}

variable "instance_name_label_key" {
  description = "Label key used to track instance name for billing"
  type        = string
  default     = "instance_name"
}

variable "edition" {
  description = "The edition of the instance, can be ENTERPRISE or ENTERPRISE_PLUS."
  type        = string
  default     = null
}

variable "iam_users" {
  description = "A list of IAM users to be created in your CloudSQL instance."
  type = list(object({
    id    = string,
    email = string
  }))
  default = []
}

variable "deny_maintenance_period" {
  description = "The Deny Maintenance Period fields to prevent automatic maintenance from occurring during a 90-day time period."
  type = list(object({
    end_date   = string
    start_date = string
    time       = string
  }))
  default = []
}

variable "enable_automated_exports" {
  description = "Enables automated exports to GCS."
  type        = bool
  default     = false
}

variable "schedule" {
  description = "Cron format schedule on which the job will execute."
  type        = string
  default     = "0 5 * * 0" # 5AM on Sundays
}

variable "time_zone" {
  description = "Time zone for interpreting the schedule using time zone name from tz database."
  type        = string
  default     = "Europe/London"
}

variable "pubsub_target" {
  description = "Pub/Sub target for the job to publish a message to."
  type = object({
    topic_name = string
    data       = string
  })
  default = {
    topic_name = "cloudsql-exports"
    data       = "test"
  }
}

variable "dbs_to_export" {
  description = "Databases to export. null to export all except mysql, or a list of strings enclosed in square brackets."
  type        = string
  default     = "null"
}

variable "pubsub_topic" {
  description = "Name of pubsub topic for automated exports."
  type        = string
  default     = "cloudsql-exports"
}

# TODO:
# variable "export_to_project" {
# }
