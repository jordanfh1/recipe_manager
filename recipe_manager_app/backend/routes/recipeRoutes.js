const express = require('express');
const router = express.Router();
const Recipe = require('../modeels/Recpipe');

// get all recipes
router.get('/', async (req, res) => {
    try {
        const recipes = await Recipe.find();
        res.json(recipes);
    } catch (error) {
        res.status(500).json({ message: 'Error fetching recipes', error: error.message });
    
    }
});

router.get('/:id', async (req, res) => {
    try {
        const recipe = await Recipe.findById(req.params.id);
    if (!recipe) {return res.status(404).json({ message: 'Recipe not found' });
    res.json(recipe);}
    } catch (error) {
        res.status(500).json({ message: 'Error fetching recipe', error: error.message });
    }
    });

// create a new recipe
router.post('/', async (req, res) => {
try {
    const recipe = new Recipe(req.body);
    await recipe.save();
    res.status(201).json(recipe);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
});

//update a recipe
router.put('/:id', async (req, res) => {
    try {
        const recipe = await Recipe.findByIdAndUpdate(req.params.id, req.body , { new: true });
        res.json(recipe);
    } catch (error) {
        res.status(500).json({error: 'Error updating recipe', message: error.message });
    }
});

// delete a recipe
router.delete('/:id', async (req, res) => {
    try {
        await Recipe.findByIdAndDelete(req.params.id);
        res.status(204).send();
    } catch (error) {
        res.status(500).json({ message: 'Error deleting recipe', error: error.message })
    }
});

module.exports = router;