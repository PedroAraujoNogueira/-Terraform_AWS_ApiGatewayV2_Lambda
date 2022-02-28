provider "aws" {
  region = "us-east-1"
}

data "archive_file" "lambda_echo" {
  type = "zip"

  source_dir  = "lambda"
  output_path = "lambda.zip"
}

resource "aws_iam_role" "lambda_role" {
  name = "serverless_lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }  
    }]
  })
}

resource "aws_lambda_function" "echo_function" {
  function_name = "echoFunction"
  filename      = "lambda.zip"

  runtime = "nodejs14.x"
  handler = "lambda.handler"

  source_code_hash = data.archive_file.lambda_echo.output_base64sha256

  role = aws_iam_role.lambda_role.arn
}

resource "aws_apigatewayv2_api" "api_lambda" {
  name          = "apiLambda"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "lambda_stage" {
  api_id = aws_apigatewayv2_api.api_lambda.id

  name        = "apiLambdaStage"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id = aws_apigatewayv2_api.api_lambda.id

  integration_uri    = aws_lambda_function.echo_function.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "lambda_route" {
  api_id = aws_apigatewayv2_api.api_lambda.id

  route_key = "GET /teste"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.echo_function.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.api_lambda.execution_arn}/*/*"
}
