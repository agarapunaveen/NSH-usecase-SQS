output "execution_role_arn" {
  value = aws_iam_role.lambda_execution_role.arn
}


output "greeting_queue_role_arn" {
  value = aws_iam_role.api_gateway_greeting_queue_role.arn
}
output "greeting_lambda_sqs_policy_attachment" {
  value = aws_iam_role_policy_attachment.greeting_lambda_sqs_policy_attachment
}