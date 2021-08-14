# HCL - Hashicorp Configuration Language
# Linguagem Declarativa


resource "aws_s3_bucket" "datalake" {
  # Parametros de configuração do recurso (Google it!)
  bucket = "${var.base_bucket_name}-${var.environment}-${var.numero_conta}"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_object" "codigo-spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../Projetos/job_spark.py"
  etag   = filemd5("../Projetos/job_spark.py") # Não dá pra referenciar a variável source??

}

provider "aws" {
  region = "us-east-2" # O ideal aqui é colocar em variáveis, para reaproveitar...
}