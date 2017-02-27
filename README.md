# Thank you for checking out my app!

## About

This app was constructed in order to practice creating a full stack application using Ruby on Rails. I created ERD wrote out my API end-points with my end design/funcationality in mind so that I could create my relational tables. Using rails in this way I was impressed by how much it does for you but was able to customize it to meet this app's needs.

This app allows a user to have many giftees. For each giftee the user can save one set of notes to each giftee, and can add many ideas as they can think of! Each note and idea references the giftee id so other giftees, or users, do not have access to them.

One feature I didn't get to within the week long project time frame was being able to update the ideas (patch `/idea/:id`). I designed the project to not require a delete on ideas so that they are stored and eventually, when I can get back to the app, can be filtered to show your past ideas.

### API End-Points

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| post   | `/sign-up`             | `users#signup`    |
| post   | `/sign-in`             | `users#signin`    |
| delete | `/sign-out/:id`        | `users#signout`   |
| patch  | `/change-password/:id` | `users#changepw`  |
| post   | `/giftee`              | `giftees#create`  |
| get    | `/giftee/`             | `giftees#index`   |
| get    | `/giftee/:id`          | `giftees#show`    |
| delete | `/giftee/:id`          | `giftees#destroy` |
| get    | `/note/:id`            | `notes#show`      |
| patch  | `/note/:id`            | `notes#update`    |
| get    | `/idea/:id`            | `ideas#show`      |
| post   | `/idea/`               | `ideas#create`    |
| patch  | `/idea/:id`            | `ideas#update`    |

## ERD
My ERD:
![alt text](https://raw.githubusercontent.com/cathyob/gift-list-api/master/ERD.png "ERD")

## Take a gander at the pretty stuff here:
https://github.com/cathyob/gift-list-browser

## Take a peek at the back end:
https://giftlistcathyob.herokuapp.com/

## Take a look and try it out here:
https://cathyob.github.io/gift-list-browser/
