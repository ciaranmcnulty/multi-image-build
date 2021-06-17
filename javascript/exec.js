const fs = require('fs');

fs.writeFile("build/result", "Hello world", function() {
    console.log("The file was saved!");
});
