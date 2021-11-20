#!/bin/bash

yarn init -y
yarn add typescript
npx tsc --init
yarn add body-parser cross-env dotenv express helmet rimraf
# body-parser extracts the entire body of an incoming request stream (for Express) and exposes it on req.body as something easier to work with, typically using JSON.
# cross-env sets environment variables without us having to worry about the platform.
# dot-env loads in .env variables into process.env so we can access them inside our *.ts files.
# express is a framework for building APIs, such as handling GET, POST, PUT, DELETE requests with ease and building your application around it. It’s simple and extremely commonly used.
# helmet adds some sensible default security Headers to your app.
# rimraf is essentially a cross-platform rm -rf for Node.js so we can delete older copies of our dist directory before recompiling a new dist
yarn add @types/body-parser @types/express @types/node
yarn add -D concurrently nodemon
