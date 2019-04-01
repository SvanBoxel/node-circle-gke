const express = require('express')
const app = express()
const fs = require('fs');

/*
    For the purpose of making the testing easier, we've just put this
    in a seperate file.
*/
const myLib = require('./lib')

const commitRef = process.env.APP_COMMIT_REF || 'N/A'
const buildDate = process.env.APP_BUILD_DATE || new Date().toISOString()
const branchName = process.env.APP_BRANCH_NAME || 'N/A'


app.get('/', (req, res) => {
    fs.readFile('./index.html', (err, html) => {
        if (err) {
          throw err;
        }

        response.writeHeader(200, { 'Content-Type': 'text/html' });
        response.render(__dirname + "/index.html", {welcome:'aaa'});
        // response.write(html);
        // response.write(`Server time: ${new Date(Date.now()).toLocaleString()}`)
        response.end();
    });
    const welcome = myLib.helloWorld()
    const text = `${welcome}! 

    We're at commit ${commitRef} on branch ${branchName}.

    It was built at ${buildDate}.`
    res.send(text)
})

app.listen(3000, () => console.log('Example app listening on port 3000!'))

