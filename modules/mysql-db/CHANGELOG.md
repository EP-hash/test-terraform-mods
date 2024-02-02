# Changelog
All notable changes to this project will be documented in this file.

## [Unreleased]
## [1.2.2] 2024-01-05
### Changed
- Remove cloudsql-exports data block; replace pubsub_target `topic_name` with full resource address

## [1.2.1] 2023-12-01
### Added
- Bump upstream sql-db to 17.1.0 to allow 5.x provider

## [1.2.0] 2023-09-26
### Added
- Bumped upstream sql-db to 16.1.0
- Added `edition`, `iam_users` and `deny_maintenace_period`

## [1.1.1] 2022-11-18
### Changed
- Fixed required field definitions for read_replica

## [1.1.0] 2022-11-16
### Added
- Bump sql-db to 13.0.1 for cloudsql insights and HA replicas

## [1.0.8] 2022-02-01
### Added
- Fixed overwriting of read_replica labels

## [1.0.7] 2022-02-01
### Added
- Bump upstream sql-db to 9.0.0 to allow 4.x provider

## [1.0.6] 2022-01-26
### Added
- Fixed overwriting of read_replica_configuration

## [1.0.5] 2022-01-22
### Changed
- Allow read replicas to have a custom db tier

## [1.0.4] 2022-01-21
### Added
- Added missing `encryption_key_name` to read replica config

## [1.0.3] 2022-01-18
### Added
- Point to commit allowing 4.x provider

## [1.0.2] 2022-01-17
### Added
- `instance_name` label

## [1.0.1] 2022-01-07
### Added
- Read replica config fix

## [1.0.0] 2022-01-06
### Added
- Migrate sql-db from terraform-gcp repo and rename to mysql-db
- `instance_role` label for masters and replicas
