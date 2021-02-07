const Pool = require("pg").Pool
const pool = new Pool({
  user: "frey",
  host: "localhost",
  database: "cdb",
  password: "123456",
  port: 5432
})

const getArticles = (req, res) => {
  pool.query("SELECT * FROM articles ORDER BY id DESC", (err, results) => {
    if (err)
      throw(err)
    
    res.status(200).json(results.rows)
  })
}

const getArticlesById = (req, res) => {
  const id = parseInt(req.params.id);

  pool.query("SELECT * FROM articles WHERE id = $1", [id], (err, results) => {
    if (err)
      throw (err)
    
    res.status(200).json(results.rows)
  })
}

const createArticle = (req, res) => {
  const { title, content } = req.body;

  pool.query("INSERT INTO articles (title, content) VALUES ($1, $2)", [title, content], (err, results) => {
    if (err)
      throw(err)
    
    res.status(201).json({
      status: "success",
      message: `Articles added!`
    })
  })
}

module.exports = { getArticles, getArticlesById, createArticle }