provider "aws" {
  region = "ap-southeast-2"
}

#create IAM groups
resource "aws_iam_group" "group1" {
  name = "group1"
}
resource "aws_iam_group" "group2" {
  name = "group2"
}
resource "aws_iam_group" "group3" {
  name = "group3"
}

resource "aws_iam_user" "user1" {
  name = "jerome"
}

resource "aws_iam_user" "user2" {
  name = "marc"
}

# Group Association
resource "aws_iam_group_membership" "group1" {
  name = "group1_members"
  users = [
    aws_iam_user.user1.name
  ]

  group = aws_iam_group.group1.name
}

resource "aws_iam_group_membership" "group2" {
  name = "group2_members"
  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name
  ]

  group = aws_iam_group.group2.name
}
resource "aws_iam_group_membership" "group3" {
  name = "group3_members"
  users = [
    aws_iam_user.user2.name
  ]

  group = aws_iam_group.group3.name
}


