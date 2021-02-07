const express = require("express")
const route = express.Router();
const dbArticles = require("../db/articles")

route.get("/api/v1/articles", dbArticles.getArticles)
route.get("/api/v1/articles/:id", dbArticles.getArticlesById)
route.post("/api/v1/articles", dbArticles.createArticle)

module.exports = route