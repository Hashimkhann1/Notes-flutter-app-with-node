
const mongoose = require('mongoose');

const noteSchema = mongoose.Schema({
    id: {
        type: String,
        unique: true,
        required: true
    },
    userId: {
        type: String,
        required: true
    },
    title: {
        type: String,
        required: true
    },
    content: {
        type: String,
    },
    date : {
        type: Date,
        default: Date.now
    }
    
});


module.exports = mongoose.model("Note" , noteSchema);