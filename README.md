This project contains some terraform modules to help me set up another project running on top of a kubernetes cluster.


# Modules

## kubegress



### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | reference | `string` | `false` | no |
| namespace | Namespace where to create the database | `string` | n/a | yes |
| size | Database size | `string` | `2Gi` | no |
| replicas | Number of replicas - always 1 master | `number` | `2` | no |
| enable_backup | Enable auto-backups | `bool` | `false` | no |
| wal_level | PG Wal Level | `string` | `logical` | no |
| db_name | Database name | `string` | `false` | yes |
| db_user | Database user | `string` | `false` | yes |
| db_password | Database password | `string` | `false` | yes |
| max_connections | Max allowed connections | `number` | `50` | no |

Probably does not makes sense to output those vars now. But if I change it later to not accept user and password, it could do.

### Outputs

| Name | Description |
|------|-------------|
| db_user | Database user |
| db_password | Database password |

