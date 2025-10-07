# cognito.tf
resource "aws_cognito_user_pool" "users" {
  name = "users-pool"

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = false
    require_uppercase = true
  }

  schema {
    name     = "email"
    required = true
    attribute_data_type = "String"
  }

  username_attributes = ["email"]

  admin_create_user_config {
    allow_admin_create_user_only = false
  }
}

resource "aws_cognito_user_pool_client" "users_client" {
  name         = "users-client"
  user_pool_id = aws_cognito_user_pool.users.id
  explicit_auth_flows = ["ALLOW_CUSTOM_AUTH", "ALLOW_USER_PASSWORD_AUTH", "ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_SRP_AUTH"]
  generate_secret = false
  refresh_token_validity = 30
}

output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.users.id
}
output "cognito_user_pool_client_id" {
  value = aws_cognito_user_pool_client.users_client.id
}

