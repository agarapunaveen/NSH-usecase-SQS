# Create a zip file with function code
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "./index.mjs"
  output_path = "lambda.zip"
}

# Create a Lambda function
resource "aws_lambda_function" "greeting_lambda" {
  function_name = "greetings-lambda-function"

  handler     = "index.handler"
  runtime     = "nodejs18.x"
  memory_size = 256
  role        = var.execution_role_arn

  environment {
    variables = {
      SRC_BUCKET = var.src_bucket_id,
      DST_BUCKET = var.dst_bucket_id
    }
  }

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}
