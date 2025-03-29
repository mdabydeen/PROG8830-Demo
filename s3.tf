resource "random_integer" "s3_bucket_suffix" {
  min = 1000
  max = 99999
}


resource "aws_s3_bucket" "web_bucket" {
  bucket        = "conestoga-prog8830-${random_integer.s3_bucket_suffix.result}"
  force_destroy = true

  // tags 
  tags = {
    Name = ""
  }
}

resource "aws_s3_bucket_versioning" "web_bucket_versioning" {
  bucket = aws_s3_bucket.web_bucket.id

  versioning_configuration {
    status = "Disabled"
  }
}


resource "aws_s3_object" "htmlfile" {
  bucket = aws_s3_bucket.web_bucket.bucket
  key    = "/webcontent/index.html"
  source = "./webcontent/index.html"

  // tags 
  tags = {
    Name = ""
  }
}

resource "aws_s3_object" "stylesheet" {
  bucket = aws_s3_bucket.web_bucket.bucket
  key    = "/webcontent/styles.css"
  source = "./webcontent/styles.css"

  // tags 
  tags = {
    Name = ""
  }
}

resource "aws_s3_object" "programsimg" {
  bucket = aws_s3_bucket.web_bucket.bucket
  key    = "/webcontent/programs.jpg"
  source = "./webcontent/programs.jpg"

  // tags 
  tags = {
    Name = ""
  }
}

resource "aws_s3_object" "studentsimg" {
  bucket = aws_s3_bucket.web_bucket.bucket
  key    = "/webcontent/students.jpg"
  source = "./webcontent/students.jpg"

  // tags 
  tags = {
    Name = ""
  }
}

resource "aws_s3_object" "campusimg" {
  bucket = aws_s3_bucket.web_bucket.bucket
  key    = "/webcontent/campus.jpg"
  source = "./webcontent/campus.jpg"

  // tags 
  tags = {
    Name = ""
  }
}
