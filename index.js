//this is where i import the dependencies 
const express = require('express');
const mysql = require('mysql2');

//this is where i setup express
const port = 3000;
const app = express();

//this is where i integrate pug with express
app.set("view engine", "pug");

//this connects assets from the static folder
app.use(express.static("static"));

// this is where i setup the  database connection 
const db = mysql.createConnection({
    host: process.env.DATABASE_HOST || "localhost",
    user: "user",
    password: "password",
    database: "world",
  });

//this is where i have defined routes and this is also the landing route
app.get('/',(req,res) => {
    res.render('index');
});

//this is a test route i wish to keep
app.get("/ping", (req, res) => {
    res.send("pong");
});

//a clear example of landing route
app.get('/',(req,res) => {
    res.render('index');
});

// Gallery route
app.get("/gallery", (req, res) => {
    res.render("gallery");
  });
  
// About route for about page
  app.get("/about", (req, res) => {
    res.render("about", { title: "Population about page" });
  });

// this should returns an array of cities from the database
app.get("/cities", (req, res) => {
    db.execute("SELECT * FROM `city`", (err, rows, fields) => {
      console.log(`/cities: ${rows.length} rows`);
      return res.render("cities", {rows, fields });
    });
  });

//this is what actually starts the webserver
app.listen(port, () => {
    console.log('server running');
});