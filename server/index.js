console.log("Kaise hain aap log ?");

const express = require('express'); // import '....material.dart'
const dash = require('./routes/dash');

const app  = express(); // dataModel = DataModel();
const PORT = 3000;

// https://www.npmjs.com/nodemon -> Run NodeMon Website
//http://127.0.0.1/nodemon -> print(Run NodeMon Website)

app.get("/" , function(req, res){
res.send("HOME PAGE");
});

app.use(dash);

// CLIENT <-middleware-> SERVER

app.get("/nodemon", function(req , res){
    console.log("Run NodeMon Website");
    res.send("NodeMon Website");

})

// 0.0.0.0 -- Anywhere
app.listen(PORT, function(){
    console.log("NODEJS SERVER STARTED...");
})


