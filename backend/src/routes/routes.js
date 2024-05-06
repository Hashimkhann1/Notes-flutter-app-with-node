const express = require('express');
const Note = require('../models/note');

const router = express.Router();


router.post('/list/' , async function(req , res) {
    var notes = await Note.find({userId: req.body.userId});
    res.json(notes);
});

router.post('/add' , async function(req , res) {

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
router.post('/delete', async function(req , res) {
    const idToDelete = req.body.id;

    await Note.deleteOne({ id: idToDelete });

    const response = { message: "Note deleted with id: " + idToDelete };
    res.json(response);
});

module.exports = router;
