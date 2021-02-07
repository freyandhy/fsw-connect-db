const express = require("express")
const route = express.Router();
const dbAuthors = require("../db/authors")

route.get("/api/v1/authors", dbAuthors.getAuthors)

module.exports = route