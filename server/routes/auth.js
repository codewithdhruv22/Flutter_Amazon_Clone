const express = require('express');

const authRouter = express.Router();
// mongodb+srv://codewithdhruv22:dhruv22@cluster0.prp9k2h.mongodb.net/?retryWrites=true&w=majority

authRouter.post("/api/signup" , (req, res)=>{
    // req.body - Map Type - {name : "adad" , email : "adAd@faf.ada" , password : "adad"}
    
    // Recieve Data from User
    const {name, email, password} = req.body;

//Validation
//Upload that data to db
});

module.exports = authRouter;