const express = require("express")
const bodyParser = require("body-parser")
const app = express();
const db = require("./queries")
const port = 3030

// parse application/json
app.use(bodyParser.json())
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

app.get("/", (req, res) => {
  res.json("Simple RESTful API with NodeJs, ExpressJs, and Postgres")
})

app.get("/api/v1/articles", db.getArticles)
app.get("/api/v1/articles/:id", db.getArticlesById)
app.post("/api/v1/articles", db.createArticle)

app.listen(port, () => console.log(`Server is ready, at port ${port}!`))