resource "aws_iam_role_policy" "gh_actions_dynamodb" {
  name   = "AcademyGhActionsDynamoDbRolePolicy"
  policy = data.aws_iam_policy_document.dynamodb_user.json
  role   = aws_iam_role.gh_actions.id
}

data "aws_iam_policy_document" "dynamodb_user" {
  statement {
    sid     = "ManageDynamoDbTerraformState"
    effect  = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"
    ]

    resources = [
      "arn:aws:dynamodb:*:*:table/academy-walking-skeleton-sept-2021-tf-state-lock"
    ]
  }
}
