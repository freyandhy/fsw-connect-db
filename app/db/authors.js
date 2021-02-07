const { Client } = require("pg")
const connectionString = 'postgresql://frey:123456@localhost:5432/cdb'

const client = new Client({
  connectionString,
})
client.connect()

const getAuthors = (req, res) => {
  client.query("SELECT * FROM authors ORDER BY id DESC", (err, result) => {
    if (err)
      throw(err)
    
    res.status(200).json({
      status: "success",
      data: result.rows
    })
  })
}

module.exports = { getAuthors }