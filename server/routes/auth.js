const express = require('express');
const User = require('../model/user')
const authRouter = express.Router();


//Validation
authRouter.post("/api/signup" , async (req, res)=>{

try{
        // Recieve Data from User
    const {name, email, password} = req.body;
    

    // req.body - Map Type - {name : "adad" , email : "adAd@faf.ada" , password : "adad"}
    const exist = await User.findOne({email});
    if(exist){
        return res.status(400).json({msg : "User already exist."});
    }


//Upload that data to db

var user = new User({
    email,
    password,
    name,
});
user = await user.save();
res.json(user);

}catch(er){
res.status(500).json({error : er.message});
};

});

module.exports = authRouter;