const app = require('express')();
const port = 4002;

app.get('/', (req, res) => {
    console.log('get request to root path');
    console.log(`show process running dir ${process.cwd()}`);

    return res.send('Welcome to black lodge');
});

app.listen(port, () => console.log(`app listen port ${port}`));

