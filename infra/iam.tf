resource "aws_iam_role" "ecs_task_role" {
  name = "ecsAppS3AccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Effect = "Allow",
      Sid    = ""
    }]
  })
}

resource "aws_iam_policy" "s3_read_policy" {
  name = "ecsTaskS3ReadPolicy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "s3:GetObject",
        "s3:ListBucket",
        "s3:ListAllMyBuckets"
      ],
      Resource = [
        "*"
      ]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_s3_read" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}
