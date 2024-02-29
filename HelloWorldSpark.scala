import org.apache.spark.sql.SparkSession
object HelloWorldSpark {
    def main(args: Array[String]): Unit = {
        val spark = SparkSession.builder()
            .appName("HelloWorldSpark")
            .master("local[*]")
            .getOrCreate()
        println("Hello, World!")
        spark.stop()
    }
}
