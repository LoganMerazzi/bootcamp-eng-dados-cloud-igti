resource "aws_s3_bucket_object" "job_spark" {
    bucket = aws_s3_bucket.dl.id
    key = "emr-code/pyspark/job_spark_from_tf.py"
    acl = "private"
    source = "../Projetos/job_spark.py"
    etag = filemd5("../Projetos/job_spark.py")
}

resource "aws_s3_bucket_object" "delta_insert" {
    bucket = aws_s3_bucket.dl.id
    key = "emr-code/pyspark/01_delta_spark_insert.py"
    acl = "private"
    source = "../Projetos/etl/01_delta_spark_insert.py"
    etag = filemd5("../Projetos/etl/01_delta_spark_insert.py")
}

resource "aws_s3_bucket_object" "delta_upsert" {
    bucket = aws_s3_bucket.dl.id
    key = "emr-code/pyspark/02_delta_spark_upsert.py"
    acl = "private"
    source = "../Projetos/etl/02_delta_spark_upsert.py"
    etag = filemd5("../Projetos/etl/02_delta_spark_upsert.py")
}

