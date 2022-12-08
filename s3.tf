#create s3 bucket with for_each(map).

resource "aws_s3_bucket" "mys3" {

  for_each = {
    "dev" = "sam-s3-bucket-777"
    "qa"  = "sam1-s3-bucket-778"
    "prod" = "samm-s3-bucket-779"
  }

  bucket = "$(each.key)-$(each.value)"
  acl    = "private"

  tags = {
    value          = each.value
    env            = each.key
    s3-bucket-name = "$(each.key)-$(each.value)"
  }

}

#create IAM user with for_each(set of string => toset)

resource "aws_iam_user" "iamuser" {
    for_each = toset(["sam", "naveed", "manoj", "anagh", "arun"])
    name     = each.key
}
