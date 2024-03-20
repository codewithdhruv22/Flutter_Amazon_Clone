const express = require('express');
const bcryptjs = require('bcryptjs');
const User = require('../model/user');
const jwt = require('jsonwebtoken');
const auth =  require('../middlewares/auth');
const { createConnection } = require('mongoose');
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

const hashedPassword = await bcryptjs.hash(password , 3);
//Upload that data to db

var user = new User({
    email,
    password : hashedPassword,
    name,
});
user = await user.save();
res.json(user);

}catch(er){
res.status(500).json({error : er.message});
};

});







authRouter.post("/validateStamp" , async (req, res)=> {

try{

    const stamp = req.header('stamp');
    if(!stamp) return res.json(false);
    const isValid = jwt.verify(stamp , 'secretKey');
    if(!isValid) return res.json(false);
    const user = await User.findById(isValid.id);
    if(!user) return res.json(false);
    res.json(true);
}catch (e){
    res.status(500).json({error  : e.message});
}
});




authRouter.post("/api/signin", async(req, res)=>{
    try {
        const {email, password} = req.body;

        const user = await User.findOne({email});
    if(!user){
        return res.status(400).json({msg : "User doesn't exist."});
    }

    const isMatching = await bcryptjs.compare(password , user.password);
    if(!isMatching){
        return res.status(400).json({msg: 'Incorrect Password'});
    }


//JSONWEBTOKEN

// TOKEN creation
// Token Transmission
// Token Usage
// Token Verification
// Access Control
const stamp  = jwt.sign({id : user._id,} , "secretKey");
res.json({stamp , ...user._doc});

// 
// 
// //{
//     "name" : "Dhruv",
//     "email" : "dddddd@gmail.com",
//     ....
// } 

// res.json({token , ...user._doc});

// //{
    // "token" : "qur82uro_fq8qiwhieogg"
//     "name" : "Dhruv",
//     "email" : "dddddd@gmail.com",
//     ....
// } 
// 
// 
// 
// 

    } catch (error) {
        res.status(500).json({error: error.message});
    }
})


authRouter.get('/', auth, async(req, res)=>{
    const user = await User.findById(req.user);
    
    res.json({...user._doc, stamp : req.stamp});
});


//TODO: TO FETCH USER DATA
module.exports = authRouter;