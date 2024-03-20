console.log("Kaise hain aap log ?");

const express = require('express'); // import '....material.dart'
const mongoose = require('mongoose');
const dash = require('./routes/dash');
const auth = require('./routes/auth');
const DB = "mongodb+srv://codewithdhruv22:dhruv22@cluster0.prp9k2h.mongodb.net/?retryWrites=true&w=majority";


const app  = express(); // dataModel = DataModel();
const PORT = 3000;

// https://www.npmjs.com/nodemon -> Run NodeMon Website
//http://127.0.0.1/nodemon -> print(Run NodeMon Website)



app.use(dash);
app.use(express.json());
app.use(auth);

// CLIENT <-middleware-> SERVER

mongoose.connect(DB).then(() =>{
    console.log("CONNECTION SUCCESFULL");
}).catch((e)=>{
    console.log(e);
});
// PROMISE = ASYNCHRONOUS
app.get("/nodemon", function(req , res){
    console.log("Run NodeMon Website");
    res.send("NodeMon Website");

})

// 0.0.0.0 -- Anywhere 
HOST = "0.0.0.0"
app.listen(PORT,function(){

    console.log("NODEJS SERVER STARTED... %s", HOST);
})


