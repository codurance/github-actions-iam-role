resource "aws_iam_role_policy" "gh_actions_ec2" {
  name   = "AcademyGhActionsEc2RolePolicy"
  policy = data.aws_iam_policy_document.ec2_user.json
  role   = aws_iam_role.gh_actions.id
}

data "aws_iam_policy_document" "ec2_user" {
  statement {
    sid     = "ManageRepositoryContents"
    effect  = "Allow"
    actions = [
      "ec2:DescribeAccountAttributes",
      "ec2:DescribeImages",
      "ec2:DescribeInstanceAttribute",
      "ec2:DescribeInstanceCreditSpecifications",
      "ec2:DescribeInstances",
      "ec2:DescribeRouteTables",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeTags",
      "ec2:DescribeVolumes",
      "ec2:DescribeVpcs",
      "ec2:DescribeVpcAttribute",
      "ec2:RunInstances",
      "ec2:CreateTags",
    ]

    resources = [
      "*"
    ]
  }
}
