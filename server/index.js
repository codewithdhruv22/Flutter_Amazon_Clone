console.log("Kaise hain aap log ?");

const express = require('express'); // import '....material.dart'

const app  = express(); // dataModel = DataModel();
const PORT = 3000;
// 0.0.0.0 -- Anywhere
app.listen(PORT, "0.0.0.0", function(){
    console.log("NODEJS SERVER STARTED...");
})


