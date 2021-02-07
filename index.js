const express = require("express")
const bodyParser = require("body-parser")
const app = express();
const port = 3030

const routeAuthors = require("./app/routes/authors")
const routeArticles = require("./app/routes/articles")

// parse application/json
app.use(bodyParser.json())
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

app.get("/", (req, res) => {
  res.json("Simple RESTful API with NodeJs, ExpressJs, and Postgres")
})

app.use(routeAuthors);
app.use(routeArticles);

app.listen(port, () => console.log(`Server is ready, at port ${port}!`))