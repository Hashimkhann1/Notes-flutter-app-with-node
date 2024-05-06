/// Initialization
const express = require('express');
const mongoose = require('mongoose');
const Note = require('./models/note');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

mongoose.connect('mongodb+srv://hashimkhan199999:lKDobGOj2lkJ2kEz@cluster0.hq9jmt5.mongodb.net/notesdb').then(function()  {
    /// home route (/)
    app.get('/' , function(req , res){
        res.send("This is home page");
    });

    const noteRouter = require('./routes/routes');
    app.use('/notes', noteRouter);

});

const PORT = process.env.PORT || 5000;

/// Starting the server on port 5000
app.listen(PORT, function() {
    console.log('Server started at PORT: ' + PORT);
});