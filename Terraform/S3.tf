# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "test" {
  bucket = "my-tf-test-bucket-se-lunani"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}