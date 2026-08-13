output "kendra_data_sources_id" {
  description = "Map of id values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kendra_data_sources_arn" {
  description = "Map of arn values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "kendra_data_sources_configuration" {
  description = "Map of configuration values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.configuration if v.configuration != null && length(v.configuration) > 0 }
}
output "kendra_data_sources_created_at" {
  description = "Map of created_at values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.created_at if v.created_at != null && length(v.created_at) > 0 }
}
output "kendra_data_sources_custom_document_enrichment_configuration" {
  description = "Map of custom_document_enrichment_configuration values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.custom_document_enrichment_configuration if v.custom_document_enrichment_configuration != null && length(v.custom_document_enrichment_configuration) > 0 }
}
output "kendra_data_sources_data_source_id" {
  description = "Map of data_source_id values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.data_source_id if v.data_source_id != null && length(v.data_source_id) > 0 }
}
output "kendra_data_sources_description" {
  description = "Map of description values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.description if v.description != null && length(v.description) > 0 }
}
output "kendra_data_sources_error_message" {
  description = "Map of error_message values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.error_message if v.error_message != null && length(v.error_message) > 0 }
}
output "kendra_data_sources_index_id" {
  description = "Map of index_id values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.index_id if v.index_id != null && length(v.index_id) > 0 }
}
output "kendra_data_sources_language_code" {
  description = "Map of language_code values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.language_code if v.language_code != null && length(v.language_code) > 0 }
}
output "kendra_data_sources_name" {
  description = "Map of name values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.name if v.name != null && length(v.name) > 0 }
}
output "kendra_data_sources_region" {
  description = "Map of region values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.region if v.region != null && length(v.region) > 0 }
}
output "kendra_data_sources_role_arn" {
  description = "Map of role_arn values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.role_arn if v.role_arn != null && length(v.role_arn) > 0 }
}
output "kendra_data_sources_schedule" {
  description = "Map of schedule values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.schedule if v.schedule != null && length(v.schedule) > 0 }
}
output "kendra_data_sources_status" {
  description = "Map of status values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.status if v.status != null && length(v.status) > 0 }
}
output "kendra_data_sources_tags" {
  description = "Map of tags values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "kendra_data_sources_tags_all" {
  description = "Map of tags_all values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "kendra_data_sources_type" {
  description = "Map of type values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.type if v.type != null && length(v.type) > 0 }
}
output "kendra_data_sources_updated_at" {
  description = "Map of updated_at values across all kendra_data_sources, keyed the same as var.kendra_data_sources"
  value       = { for k, v in aws_kendra_data_source.kendra_data_sources : k => v.updated_at if v.updated_at != null && length(v.updated_at) > 0 }
}

