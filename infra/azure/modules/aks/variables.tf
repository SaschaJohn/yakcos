variable "location" {
    description = "The Azure region where the resources will be created"
    type        = string
    default     = "centralindia"
}

variable "name" {
  description = "The name of this instance"
  type = string
}

variable "network" {
  description = "The first three octets of ipv4 network"
  type = string
}

variable "pod" {
  description = "The pod cidr"
  type = string
}

variable "service" {
  description = "The service cidr"
  type = string
}

variable "dns" {
  description = "The dns service"
  type = string
}

variable "id" {
  description = "The dns service"
  type = number
}

variable "subscription" {
  description = "The subscription id"
  type = string
}