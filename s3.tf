resource "aws_iam_role_policy" "gh_actions_s3" {
  name   = "AcademyGhActionsS3RolePolicy"
  policy = data.aws_iam_policy_document.s3_user.json
  role   = aws_iam_role.gh_actions.id
}

data "aws_iam_policy_document" "s3_user" {
  statement {
    sid     = "ListTerraformStateBucket"
    effect  = "Allow"
    actions = [
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::terraform-remote-state-codurance-us-east-1"
    ]
  }

  statement {
    sid     = "ManageTerraformState"
    effect  = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]

    resources = [
      "arn:aws:s3:::terraform-remote-state-codurance-us-east-1/academy-walking-skeleton-sept-2021/terraform.tfstate"
    ]
  }
}
