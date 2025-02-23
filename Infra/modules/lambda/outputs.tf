output "function_name" {
  value = aws_lambda_function.greeting_lambda.function_name
}
output "function_arn" {
  value = aws_lambda_function.greeting_lambda.invoke_arn
}