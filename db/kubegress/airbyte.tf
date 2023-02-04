data "airbyte_workspace" "airbyte_workspace_pg" {
  count = var.create_airbyte_connection ? 1 : 0
  id    = var.airbyte_workspace_id
}

# Super basic custom source
resource "airbyte_source_definition" "airbyte_source" {
  count = var.create_airbyte_connection ? 1 : 0

  name              = "custom_source_definition"
  docker_repository = "airbyte/source-postgres"
  docker_image_tag  = "1.0.42"
  documentation_url = ""
  workspace_id      = data.airbyte_workspace.airbyte_workspace_pg[0].id
}

resource "airbyte_source" "airbyte_source" {
  count = var.create_airbyte_connection ? 1 : 0

  definition_id = airbyte_source_definition.airbyte_source[0].id
  workspace_id  = data.airbyte_workspace.airbyte_workspace_pg[0].id
  name          = local.airbyte_connection_name
  # The source definition above takes no parameters
  # Note that no terraform validation happens for this - just errors directly from the API
  connection_configuration = jsonencode({
    host     = local.db_host
    database = local.db_name
    port     = 5432
    username = local.db_user
    password = local.db_password
  })
}
