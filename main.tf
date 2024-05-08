resource "newrelic_alert_policy" "Slack_policy" {
  name = var.policy_name

}
data "newrelic_notification_destination" "Slack_destination" {
  name = "practice"

}
resource "newrelic_notification_channel" "Slack_Channel" {
  name           = var.notification.name
  type           = var.notification.type
  destination_id = data.newrelic_notification_destination.Slack_destination.id
  product        = var.notification.product
  property {
    key   = var.notification.key
    value = var.notification.value
  }

}
resource "newrelic_workflow" "workflow" {
  name                  = var.workflow.name1
  muting_rules_handling = var.workflow.muting_rules_handling
  issues_filter {

    name = var.workflow.name
    type = var.workflow.type

    predicate {
      attribute = var.workflow.attribute
      operator  = var.workflow.operator
      values    = [newrelic_alert_policy.Slack_policy.id]
    }
  }
  destination {
    channel_id            = newrelic_notification_channel.Slack_Channel.id
    notification_triggers = var.workflow.notification_triggers
  }
}
