policy_name = "slack_policy"

notification = {
  name    = "slack-notification-channel"
  type    = "SLACK"
  product = "IINT"


  key = "channelId"
  value = "C07227AGX8F"
  
}
workflow = {
  name                  = "workflow_2"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

#   issues_filter = {
    name1 = "Filter-name"
    type = "FILTER"

    # predicate = {
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
    # }
#   }

#   destination = {
    notification_triggers = ["ACTIVATED"]
#   }
}