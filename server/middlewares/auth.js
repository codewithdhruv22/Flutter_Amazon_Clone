const jwt = require('jsonwebtoken');


const auth = async(req, res, next) => {

    try{
    const stamp = req.header('stamp');
    if(!stamp)
        return res.stamp(401).json({msg : "No validation token, unauthorized access"});

    const verifyStamp = jwt.verify(stamp, "secretKey");
    if(!verifyStamp)
        return res.stamp(401).json({msg : "Token verification failed, unauthorized access"});

    req.user = verifyStamp.id;
    console.log("I AM REQ USER");
    console.log(req.user);
    req.stamp = stamp;
    console.log("I AM REQ STAMP");
    console.log(req.stamp);
    next();
    }catch(e){
        res.status(500).json({error:e.message});
    }
}

module.exports = auth;