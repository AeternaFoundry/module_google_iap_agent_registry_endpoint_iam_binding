resource "google_iap_agent_registry_endpoint_iam_binding" "iap_agent_registry_endpoint_iam_bindings" {
  for_each = var.iap_agent_registry_endpoint_iam_bindings

  endpoint_id = each.value.endpoint_id
  members     = each.value.members
  role        = each.value.role
  location    = each.value.location
  project     = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

