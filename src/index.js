const express = require('express')
const app = express()

app.use(express.static(__dirname + '/src'));
app.engine('html', require('ejs').renderFile);
app.set('views','./src');
app.set('view engine', 'html');

/*
    For the purpose of making the testing easier, we've just put this
    in a seperate file.
*/
const myLib = require('./lib')

const commitRef = process.env.APP_COMMIT_REF || 'N/A'
const buildDate = process.env.APP_BUILD_DATE || new Date().toISOString()
const branchName = process.env.APP_BRANCH_NAME || 'N/A'


app.get('/', (req, res) => {
    res.render('index.html', { 
        welcome: myLib.helloWorld(),
        commitRef,
        branchName,
        buildDate
    });
    res.end();
})

app.listen(3000, () => console.log('App listening on port 3000!'))

