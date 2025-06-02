const express = require('express');
const Recipe = require('./models/Recipe.js');
const mongoose = require('mongoose');
const cors = require('cors');
const app = express();
require('dotenv').config();
app.use(express.json());

const recipeRoutes = require('./routes/recipeRoutes');

const PORT = process.env.PORT || 3000;

app.use(cors());
app.use('/recipes', recipeRoutes);


// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/recipes', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})

.then(() => {
    console.log('Connected to MongoDB');
})
.catch(err => {
    console.error('MongoDB connection error:', err);
});


//Routes
app.get('/recipes',async (req, res) => {
    const recipes = await Recipe.find();
    res.json(recipes);
});

app.post('/recipes', async (req, res) => {
    const recipe = new Recipe(req.body);
    await recipe.save();
    res.status(201).json(recipe);
});

app.get('/recipes/:id', async (req, res) => {
    const recipe = await Recipe.findById(req.params.id);
    if (!recipe) {
        return res.status(404).json({ message: 'Recipe not found' });
    }
    res.json(recipe);
});

app.put('/recipes/:id', async (req, res) => {
    const recipe = await Recipe.findByIdAndUpdate(req.params.id, req.body, { new: true });
    if (!recipe) {
        return res.status(404).json({ message: 'Recipe not found' });
    }
    res.json(recipe);
});

app.delete('/recipes/:id', async (req, res) => {
    await Recipe.findByIdAndDelete(req.params.id);
    res.status(204).send();
})

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});



