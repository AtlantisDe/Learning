# Command line

## Demo

```c#
Command line instructions
You can also upload existing files from your computer using the instructions below.

// Git global setup
git config --global user.name "Administrator"
git config --global user.email "admin@example.com"

// Create a new repository
git clone git@gitlab.example.com:seo/windows-desk-control/Demotool.git
cd Demotool
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master

// Push an existing folder
cd existing_folder
git init
git remote add origin git@gitlab.example.com:seo/windows-desk-control/Demotool.git
git add .
git commit -m "Initial commit"
git push -u origin master

// Push an existing Git repository
cd existing_repo
git remote rename origin old-origin
git remote add origin git@gitlab.example.com:seo/windows-desk-control/Demotool.git
git push -u origin --all
git push -u origin --tags
```
