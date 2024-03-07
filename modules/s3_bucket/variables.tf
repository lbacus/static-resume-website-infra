variable "bucketname" {
  description = "Name of bucket"
  type        = string
}
variable "tags" {
  description = "tag description"
  type        = map(string)
  default = {

  }
}