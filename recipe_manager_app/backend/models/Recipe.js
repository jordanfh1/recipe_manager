const mongoose = require('mongoose');

const recipeSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true,
    },
    description: String,
    ingredients: String,
    method: String,
    id: String }, {timestamps: true});


const Recipe = mongoose.model('Recipe', recipeSchema);

module.exports = Recipe;
// This code defines a Mongoose schema for a recipe, which includes fields for title, description, ingredients, method, and an ID. The schema also includes timestamps to track when the recipe was created and last updated. The model is then exported for use in other parts of the application.


