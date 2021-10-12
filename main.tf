resource "aws_iam_user" "gh_actions" {
  name = "AcademyGhActionsUser"

  tags = {
    Description = "Assumes a role for running GitHub Actions tasks"
    Role        = aws_iam_role.gh_actions.arn
  }
}

resource "aws_iam_role" "gh_actions" {
  name = "AcademyGhActionsRole"

  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::300563897675:user/AcademyGhActionsUser"
      ]
    }
  }
}
