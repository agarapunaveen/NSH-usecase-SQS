module "storage" {
  source = "../../modules/storage"
}
module "iam" {
  source = "../../modules/iam"
  src_bucket_arn = module.storage.src_bucket_arn
  dst_bucket_arn = module.storage.dst_bucket_arn
  greeting_queue_arn = module.sqs.greeting_queue_arn
}
module "lambda" {
  source = "../../modules/lambda"
  execution_role_arn=module.iam.execution_role_arn
  src_bucket_id = module.storage.src_bucket_id
  dst_bucket_id = module.storage.dst_bucket_id
}
module "Gateway" {
  source = "../../modules/gateway"
  function_name = module.lambda.function_name
  function_arn = module.lambda.function_arn
  greeting_queue_role_arn=module.iam.greeting_queue_role_arn
  greeting_queue_arn = module.sqs.greeting_queue_arn
  queue_name = module.sqs.queue_name
  greeting_lambda_sqs_policy_attachment=module.iam.greeting_lambda_sqs_policy_attachment

}
module "sqs" {
  source = "../../modules/sqs"
}