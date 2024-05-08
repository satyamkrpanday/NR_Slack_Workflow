variable "policy_name" {
 type=string 
}
variable "notification" {
  type = object({
    name = string
    type = string
    product = string
    
    key = string
    value = string
  })
}
variable "workflow" {
  type = object({
    name = string
    muting_rules_handling = string
    name1 = string
    type = string
    attribute = string
    operator = string
    notification_triggers = list(string)
  })
  
}