## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.84.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudsql"></a> [cloudsql](#module\_cloudsql) | GoogleCloudPlatform/sql-db/google//modules/mysql | 17.1.0 |

## Resources

| Name | Type |
|------|------|
| [google_cloud_scheduler_job.exports](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job) | resource |
| [google_storage_bucket_iam_member.exports_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_pubsub_topic.cloudsql-exports](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/pubsub_topic) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the Cloud SQL resources | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to manage the Cloud SQL resources | `string` | n/a | yes |
| <a name="input_vpc_network"></a> [vpc\_network](#input\_vpc\_network) | Name of the service network | `string` | n/a | yes |
| <a name="input_vpc_project"></a> [vpc\_project](#input\_vpc\_project) | The ID of the global vpc project. | `string` | n/a | yes |
| <a name="input_activation_policy"></a> [activation\_policy](#input\_activation\_policy) | The activation policy for the master instance. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`. | `string` | `"ALWAYS"` | no |
| <a name="input_authorized_networks"></a> [authorized\_networks](#input\_authorized\_networks) | Networks to authorise. | `list(map(string))` | `[]` | no |
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | The availability type for the master instance. Can be either `REGIONAL` or `null`. | `string` | `"REGIONAL"` | no |
| <a name="input_backup_location"></a> [backup\_location](#input\_backup\_location) | Instance Backup location | `string` | `null` | no |
| <a name="input_create_timeout"></a> [create\_timeout](#input\_create\_timeout) | The optional timout that is applied to limit long database creates. | `string` | `"10m"` | no |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags) | List of Cloud SQL flags that are applied to the database server. See [more details](https://cloud.google.com/sql/docs/mysql/flags) | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | The database version to use | `string` | `"MYSQL_5_7"` | no |
| <a name="input_dbs_to_export"></a> [dbs\_to\_export](#input\_dbs\_to\_export) | Databases to export. null to export all except mysql, or a list of strings enclosed in square brackets. | `string` | `"null"` | no |
| <a name="input_delete_timeout"></a> [delete\_timeout](#input\_delete\_timeout) | The optional timout that is applied to limit long database deletes. | `string` | `"10m"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Used to block Terraform from deleting a SQL Instance. | `bool` | `true` | no |
| <a name="input_deny_maintenance_period"></a> [deny\_maintenance\_period](#input\_deny\_maintenance\_period) | The Deny Maintenance Period fields to prevent automatic maintenance from occurring during a 90-day time period. | <pre>list(object({<br>    end_date   = string<br>    start_date = string<br>    time       = string<br>  }))</pre> | `[]` | no |
| <a name="input_disk_autoresize"></a> [disk\_autoresize](#input\_disk\_autoresize) | Configuration to increase storage size | `bool` | `true` | no |
| <a name="input_disk_autoresize_limit"></a> [disk\_autoresize\_limit](#input\_disk\_autoresize\_limit) | The maximum size to which storage can be auto increased. | `number` | `0` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | The disk size for the master instance | `number` | `10` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | The disk type for the master instance. | `string` | `"PD_SSD"` | no |
| <a name="input_edition"></a> [edition](#input\_edition) | The edition of the instance, can be ENTERPRISE or ENTERPRISE\_PLUS. | `string` | `null` | no |
| <a name="input_enable_automated_exports"></a> [enable\_automated\_exports](#input\_enable\_automated\_exports) | Enables automated exports to GCS. | `bool` | `false` | no |
| <a name="input_encryption_key_name"></a> [encryption\_key\_name](#input\_encryption\_key\_name) | The full path to the encryption key used for the CMEK disk encryption | `string` | `null` | no |
| <a name="input_iam_users"></a> [iam\_users](#input\_iam\_users) | A list of IAM users to be created in your CloudSQL instance. | <pre>list(object({<br>    id    = string,<br>    email = string<br>  }))</pre> | `[]` | no |
| <a name="input_insights_config"></a> [insights\_config](#input\_insights\_config) | The insights\_config settings for the database. | <pre>object({<br>    query_plans_per_minute  = number<br>    query_string_length     = number<br>    record_application_tags = bool<br>    record_client_address   = bool<br>  })</pre> | <pre>{<br>  "query_plans_per_minute": null,<br>  "query_string_length": null,<br>  "record_application_tags": null,<br>  "record_client_address": null<br>}</pre> | no |
| <a name="input_insights_config_enabled"></a> [insights\_config\_enabled](#input\_insights\_config\_enabled) | Enable Insights Config | `bool` | `true` | no |
| <a name="input_instance_name_label_key"></a> [instance\_name\_label\_key](#input\_instance\_name\_label\_key) | Label key used to track instance name for billing | `string` | `"instance_name"` | no |
| <a name="input_instance_role_label_key"></a> [instance\_role\_label\_key](#input\_instance\_role\_label\_key) | Label key used to track master/replicas for billing | `string` | `"instance_role"` | no |
| <a name="input_ip_configuration"></a> [ip\_configuration](#input\_ip\_configuration) | The ip\_configuration settings subblock | <pre>object({<br>    authorized_networks = list(map(string))<br>    ipv4_enabled        = bool<br>    private_network     = string<br>    require_ssl         = bool<br>    allocated_ip_range  = string<br>  })</pre> | <pre>{<br>  "allocated_ip_range": null,<br>  "authorized_networks": [],<br>  "ipv4_enabled": true,<br>  "private_network": null,<br>  "require_ssl": null<br>}</pre> | no |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | Enable Public IPv4 access | `bool` | `false` | no |
| <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day) | The day of week (1-7) for the master instance maintenance. | `number` | `1` | no |
| <a name="input_maintenance_window_hour"></a> [maintenance\_window\_hour](#input\_maintenance\_window\_hour) | The hour of day (0-23) maintenance window for the master instance maintenance. | `number` | `6` | no |
| <a name="input_maintenance_window_prod"></a> [maintenance\_window\_prod](#input\_maintenance\_window\_prod) | Set Maintenance Window to prod values | `bool` | `true` | no |
| <a name="input_maintenance_window_update_track"></a> [maintenance\_window\_update\_track](#input\_maintenance\_window\_update\_track) | The update track of maintenance window for the master instance maintenance. Can be either `canary` or `stable`. | `string` | `"canary"` | no |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | List of modules or resources this module depends on. | `list(any)` | `[]` | no |
| <a name="input_point_in_time_recovery_enabled"></a> [point\_in\_time\_recovery\_enabled](#input\_point\_in\_time\_recovery\_enabled) | Enable Point In Time Recovery | `bool` | `false` | no |
| <a name="input_pricing_plan"></a> [pricing\_plan](#input\_pricing\_plan) | The pricing plan for the master instance. | `string` | `"PER_USE"` | no |
| <a name="input_private_network"></a> [private\_network](#input\_private\_network) | Enable Private IP | `bool` | `true` | no |
| <a name="input_pubsub_target"></a> [pubsub\_target](#input\_pubsub\_target) | Pub/Sub target for the job to publish a message to. | <pre>object({<br>    topic_name = string<br>    data       = string<br>  })</pre> | <pre>{<br>  "data": "test",<br>  "topic_name": "cloudsql-exports"<br>}</pre> | no |
| <a name="input_pubsub_topic"></a> [pubsub\_topic](#input\_pubsub\_topic) | Name of pubsub topic for automated exports. | `string` | `"cloudsql-exports"` | no |
| <a name="input_read_replica_deletion_protection"></a> [read\_replica\_deletion\_protection](#input\_read\_replica\_deletion\_protection) | Used to block Terraform from deleting replica SQL Instances. | `bool` | `false` | no |
| <a name="input_read_replica_ipv4_enabled"></a> [read\_replica\_ipv4\_enabled](#input\_read\_replica\_ipv4\_enabled) | Enable public IPv4 access on replica | `bool` | `false` | no |
| <a name="input_read_replica_name_suffix"></a> [read\_replica\_name\_suffix](#input\_read\_replica\_name\_suffix) | The optional suffix to add to the read instance name | `string` | `""` | no |
| <a name="input_read_replicas"></a> [read\_replicas](#input\_read\_replicas) | List of read replicas to create | <pre>list(object({<br>    name                  = string<br>    tier                  = string<br>    zone                  = string<br>    availability_type     = string<br>    disk_type             = string<br>    disk_autoresize       = bool<br>    disk_autoresize_limit = number<br><br>    disk_size   = string<br>    user_labels = map(string)<br>    database_flags = list(object({<br>      name  = string<br>      value = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the Cloud SQL resources | `string` | `"europe-west2"` | no |
| <a name="input_replica_database_version"></a> [replica\_database\_version](#input\_replica\_database\_version) | The read replica database version to use. This var should only be used during a database update. The update sequence 1. read-replica 2. master, setting this to an updated version will cause the replica to update, then you may update the master with the var database\_version and remove this field after update is complete | `string` | `""` | no |
| <a name="input_require_ssl"></a> [require\_ssl](#input\_require\_ssl) | Requre SSL for connections | `bool` | `true` | no |
| <a name="input_schedule"></a> [schedule](#input\_schedule) | Cron format schedule on which the job will execute. | `string` | `"0 5 * * 0"` | no |
| <a name="input_secondary_zone"></a> [secondary\_zone](#input\_secondary\_zone) | The preferred zone for the secondary/failover instance, it should be something like: `us-central1-a`, `us-east1-c`. | `string` | `null` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | The tier for the master instance. | `string` | `"db-n1-standard-1"` | no |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | Time zone for interpreting the schedule using time zone name from tz database. | `string` | `"Europe/London"` | no |
| <a name="input_update_timeout"></a> [update\_timeout](#input\_update\_timeout) | The optional timout that is applied to limit long database updates. | `string` | `"10m"` | no |
| <a name="input_user_labels"></a> [user\_labels](#input\_user\_labels) | The key/value labels for the master instances. | `map(string)` | `{}` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`. | `string` | `"europe-west2-c"` | no |

## Outputs

No outputs.
