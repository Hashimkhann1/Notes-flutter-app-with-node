const express = require('express');
const Note = require('../models/note');

const router = express.Router();


router.get('/list/:userId' , async function(req , res) {
    var notes = await Note.find({userId: req.params.userId});
    res.json(notes);
});

router.post('/add' , async function(req , res) {

    await Note.deleteOne({ id: req.body.id });

    const newNote = Note({
        id: req.body.id,
        userId: req.body.userId,
        title: req.body.title,
        content: req.body.content
    });
    await newNote.save();

    const responce = {message : "new Note created!" + `id: ${req.body.id}`};
    res.json(responce);
});

/// deleting note
router.delete('/delete/:postId', async function(req , res) {

    await Note.deleteOne({ id: req.params.postId });
    const response = { message: "Note deleted with id: " + `${req.body.id}` };
    res.json(response);

});


module.exports = router;
