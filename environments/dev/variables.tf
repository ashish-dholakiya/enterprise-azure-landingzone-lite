variable "location" {
  description = "Azure region for the Dev environment"
  type        = string
}

variable "tags" {
  description = "Common tags for Dev resources"
  type        = map(string)
}