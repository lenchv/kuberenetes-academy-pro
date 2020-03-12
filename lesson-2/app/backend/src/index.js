const express = require('express');
const memesRepository = require('./repositories/memesRepository');
const app = express();
const port = process.env.PORT || 3000;

app.get('/memes', (req, res) => {
	const memes = memesRepository.findAll();
	
	res.send(memes);
});

app.listen(port, () => {
	console.log('App listening on port ' + port);
});
