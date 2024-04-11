
variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}

variable "namespaces" {
  description = "List of Namespaces"
  type        = list(string)
  default     = []
}

variable "cloudflare_email" {
  type        = string
  description = "Die E-Mail-Adresse für das Cloudflare-Konto"
  default     = "kkroesch@gmail.com"
}

variable "cloudflare_api_key" {
  type        = string
  description = "Der API-Schlüssel für das Cloudflare-Konto"
  default     = "KeeMeSecret"
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Die Zone ID deiner Domain bei Cloudflare"
  default     = "aargau.cloud"
}


