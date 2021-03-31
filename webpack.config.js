module.exports = {
    context: __dirname,
    // expects our entry is app.js from frontend folder
        // app.js is just to get us started
    entry: __dirname + "./frontend/app.js",
    output: {
        path:__dirname + "/app/assets/javascripts",
        filename: "bundle.js"
    }
}