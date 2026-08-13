variable "kendra_data_sources" {
  description = <<EOT
Map of kendra_data_sources, attributes below
Required:
    - index_id
    - name
    - type
Optional:
    - description
    - language_code
    - region
    - role_arn
    - schedule
    - tags
    - tags_all
    - configuration (block):
        - s3_configuration (optional, block):
            - access_control_list_configuration (optional, block):
                - key_path (optional)
            - bucket_name (required)
            - documents_metadata_configuration (optional, block):
                - s3_prefix (optional)
            - exclusion_patterns (optional)
            - inclusion_patterns (optional)
            - inclusion_prefixes (optional)
        - template_configuration (optional, block):
            - template (required)
        - web_crawler_configuration (optional, block):
            - authentication_configuration (optional, block):
                - basic_authentication (optional, block):
                    - credentials (required)
                    - host (required)
                    - port (required)
            - crawl_depth (optional)
            - max_content_size_per_page_in_mega_bytes (optional)
            - max_links_per_page (optional)
            - max_urls_per_minute_crawl_rate (optional)
            - proxy_configuration (optional, block):
                - credentials (optional)
                - host (required)
                - port (required)
            - url_exclusion_patterns (optional)
            - url_inclusion_patterns (optional)
            - urls (required, block):
                - seed_url_configuration (optional, block):
                    - seed_urls (required)
                    - web_crawler_mode (optional)
                - site_maps_configuration (optional, block):
                    - site_maps (required)
    - custom_document_enrichment_configuration (block):
        - inline_configurations (optional, block):
            - condition (optional, block):
                - condition_document_attribute_key (required)
                - condition_on_value (optional, block):
                    - date_value (optional)
                    - long_value (optional)
                    - string_list_value (optional)
                    - string_value (optional)
                - operator (required)
            - document_content_deletion (optional)
            - target (optional, block):
                - target_document_attribute_key (optional)
                - target_document_attribute_value (optional, block):
                    - date_value (optional)
                    - long_value (optional)
                    - string_list_value (optional)
                    - string_value (optional)
                - target_document_attribute_value_deletion (optional)
        - post_extraction_hook_configuration (optional, block):
            - invocation_condition (optional, block):
                - condition_document_attribute_key (required)
                - condition_on_value (optional, block):
                    - date_value (optional)
                    - long_value (optional)
                    - string_list_value (optional)
                    - string_value (optional)
                - operator (required)
            - lambda_arn (required)
            - s3_bucket (required)
        - pre_extraction_hook_configuration (optional, block):
            - invocation_condition (optional, block):
                - condition_document_attribute_key (required)
                - condition_on_value (optional, block):
                    - date_value (optional)
                    - long_value (optional)
                    - string_list_value (optional)
                    - string_value (optional)
                - operator (required)
            - lambda_arn (required)
            - s3_bucket (required)
        - role_arn (optional)
EOT

  type = map(object({
    index_id      = string
    name          = string
    type          = string
    description   = optional(string)
    language_code = optional(string)
    region        = optional(string)
    role_arn      = optional(string)
    schedule      = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    configuration = optional(object({
      s3_configuration = optional(object({
        access_control_list_configuration = optional(object({
          key_path = optional(string)
        }))
        bucket_name = string
        documents_metadata_configuration = optional(object({
          s3_prefix = optional(string)
        }))
        exclusion_patterns = optional(set(string))
        inclusion_patterns = optional(set(string))
        inclusion_prefixes = optional(set(string))
      }))
      template_configuration = optional(object({
        template = string
      }))
      web_crawler_configuration = optional(object({
        authentication_configuration = optional(object({
          basic_authentication = optional(list(object({
            credentials = string
            host        = string
            port        = number
          })))
        }))
        crawl_depth                             = optional(number)
        max_content_size_per_page_in_mega_bytes = optional(number)
        max_links_per_page                      = optional(number)
        max_urls_per_minute_crawl_rate          = optional(number)
        proxy_configuration = optional(object({
          credentials = optional(string)
          host        = string
          port        = number
        }))
        url_exclusion_patterns = optional(set(string))
        url_inclusion_patterns = optional(set(string))
        urls = object({
          seed_url_configuration = optional(object({
            seed_urls        = set(string)
            web_crawler_mode = optional(string)
          }))
          site_maps_configuration = optional(object({
            site_maps = set(string)
          }))
        })
      }))
    }))
    custom_document_enrichment_configuration = optional(object({
      inline_configurations = optional(list(object({
        condition = optional(object({
          condition_document_attribute_key = string
          condition_on_value = optional(object({
            date_value        = optional(string)
            long_value        = optional(number)
            string_list_value = optional(set(string))
            string_value      = optional(string)
          }))
          operator = string
        }))
        document_content_deletion = optional(bool)
        target = optional(object({
          target_document_attribute_key = optional(string)
          target_document_attribute_value = optional(object({
            date_value        = optional(string)
            long_value        = optional(number)
            string_list_value = optional(set(string))
            string_value      = optional(string)
          }))
          target_document_attribute_value_deletion = optional(bool)
        }))
      })))
      post_extraction_hook_configuration = optional(object({
        invocation_condition = optional(object({
          condition_document_attribute_key = string
          condition_on_value = optional(object({
            date_value        = optional(string)
            long_value        = optional(number)
            string_list_value = optional(set(string))
            string_value      = optional(string)
          }))
          operator = string
        }))
        lambda_arn = string
        s3_bucket  = string
      }))
      pre_extraction_hook_configuration = optional(object({
        invocation_condition = optional(object({
          condition_document_attribute_key = string
          condition_on_value = optional(object({
            date_value        = optional(string)
            long_value        = optional(number)
            string_list_value = optional(set(string))
            string_value      = optional(string)
          }))
          operator = string
        }))
        lambda_arn = string
        s3_bucket  = string
      }))
      role_arn = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.kendra_data_sources : (
        v.configuration == null || (v.configuration.web_crawler_configuration == null || (v.configuration.web_crawler_configuration.authentication_configuration == null || (v.configuration.web_crawler_configuration.authentication_configuration.basic_authentication == null || (length(v.configuration.web_crawler_configuration.authentication_configuration.basic_authentication) <= 10))))
      )
    ])
    error_message = "Each basic_authentication list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_data_sources : (
        v.custom_document_enrichment_configuration == null || (v.custom_document_enrichment_configuration.inline_configurations == null || (length(v.custom_document_enrichment_configuration.inline_configurations) <= 100))
      )
    ])
    error_message = "Each inline_configurations list must contain at most 100 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_data_sources : (
        can(regex("[0-9A-Za-z][0-9A-Za-z-]{35}", v.index_id))
      )
    ])
    error_message = "Starts with an alphanumeric character. Subsequently, can contain alphanumeric characters and hyphens. Fixed length of 36."
  }
  # Note: 28 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

