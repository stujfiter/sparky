import static spark.Spark.*;


public class MyApp {
    public static void main(String[] args) {
        //0.0.0.0:4567/hello
        get("/hello", (req, res) -> "Hello, World!");
        get("/hello/:name", (req, res) -> "Hello, " + req.params("name") + "!");
    }
}
