resource "aws_iam_role_policy" "gh_actions_ecr" {
  name   = "AcademyGhActionsPublicEcrRolePolicy"
  policy = data.aws_iam_policy_document.ecr_user.json
  role   = aws_iam_role.gh_actions.id
}

data "aws_iam_policy_document" "ecr_user" {
  statement {
    sid       = "GetAuthorizationToken"
    effect    = "Allow"
    actions   = [
      "ecr-public:GetAuthorizationToken",
      "sts:GetServiceBearerToken",
    ]
    resources = ["*"]
  }

  statement {
    sid     = "ManageRepositoryContents"
    effect  = "Allow"
    actions = [
      "ecr-public:BatchCheckLayerAvailability",
      "ecr-public:CompleteLayerUpload",
      "ecr-public:InitiateLayerUpload",
      "ecr-public:PutImage",
      "ecr-public:UploadLayerPart"
    ]

    resources = [
      "arn:aws:ecr-public::300563897675:repository/academy/*",
    ]
  }
}
