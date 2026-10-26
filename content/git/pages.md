# Pages

> Here we explain GitHub pages, a way to easily publish your work as a website. 

## What it is
GitHub (but also GitLab, if it is enabled) allows you to make use of **pages**. This is a feature that let's you create a website hosted on GitHub. You can create .html files, or even have markdown files converted to a website using Jupyter Book. 

To do this automatically, you can make use of GitHub Actions, or in GitLab a CI/CD script. In both cases, a Linux-based runner  is used to perform some actions (like installing software, converting from markdown to html, and creating an artifact containing the generated HTML files). More on the _actions_ below. 

Your website is usually hosted using the following url: https://<username>.github.io/<repositoryname>. It is possible to connect GitLab/GitHub to an external server - but that is beyond our scope.


## GitHub action for JB
As said, we can make use of GitHub actions to build our website. A minimal version example is shown below - this action only converts the markdown & notebooks into html and uploads these as package to GitHub pages. No fancy stuff like executing python scripts during build, or automatically building a pdf - which is all possible!

```{code} bash
name: MyST GitHub Pages Deploy
on:
  push:
    branches: [main]

env:
  BASE_URL: /${{ github.event.repository.name }}

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: false

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}

    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v7

      - name: Setup Pages
        uses: actions/configure-pages@v5

      - name: Setup Node
        uses: actions/setup-node@v5
        with:
          node-version: 24

      - name: Install MyST
        run: npm install -g mystmd

      - name: Build HTML Assets
        run: myst build --html 

      - name: Upload HTML artifact
        uses: actions/upload-pages-artifact@v5
        with:
          path: ./_build/html

      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v5
```

## Enable GitHub Pages
To enable GitHub pages using actions:

1. Go to `Settings` (top mid of the screen) and click `Pages`. From the dropdown menu under `Build and Development` choose `GitHub Actions` as source. 
1. Click on `Code` in the top left corner and click on ⚙ (the `gear-icon` near **About**) at the right site of the page. Check the box `Use your GitHub Pages` website.

If a GitHub action is present (in the folder `.github/workflows`) it will rebuild the site with every new commit to GitHub.



