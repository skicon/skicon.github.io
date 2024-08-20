# Website Documentation

This site is built with `Hugo` and the `Hello-Friend-ng` theme

## Content
The content for each page and menu items is a `.md` file in `content`. The menu item and order can be set in the yaml header portion of the `.md` file.  
There shouldn't be a need to add the item to `hugo.toml` but for some reasons, `Conference` don't want to behave and go all the way to the end if the entry is removed from `hugo.toml`

## Menu 
The menu style is controlled by `static/css/menu.css` and is display using `themes/hello-friend-ng/layouts/partials/menu.html` and `themes/hello-friend-ng/layouts/partials/nav.html`  

## Background image
The background image is loaded in `hugo.toml` and is stored in `static/img/`

## Deployment
There is a GitHub workflow that publishes the site after every push to the `main` branch. It's the default script from the Hugo website. 

## Modidy the Website
Anyone who wants to modify the site should 

1. Install Hugo on their local machine
2. Clone this repo
3. Create a branch `git checkout -m my-test-branch`
4. Test the changes locally
5. Create a PR
6. Have their PR approved/merged 
