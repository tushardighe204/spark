import org.apache.spark.sql.SparkSession

object SparkTest {
  def main(args: Array[String]): Unit = {
    // Create SparkSession
    val spark = SparkSession.builder()
      .appName("SparkTest")
      .master("local[*]")
      .getOrCreate()

    // Create DataFrame
    val data = Seq(("John", 25), ("Alice", 30), ("Bob", 35))
    val df = spark.createDataFrame(data).toDF("Name", "Age")

    // Show DataFrame
    df.show()

    // Stop SparkSession
    spark.stop()
  }
}
