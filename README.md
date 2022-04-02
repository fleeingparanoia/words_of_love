# words_of_love

A small and simple flutter project with the goal of displaying cute comments that can be found under lofi videos on youtube.

## Idea

The user can "subscribe" to his favourite youtube channels. After that, he can cycle through the top comments of each video and save the ones he likes. A list with every video of every channel is kept somewhere and shuffled each time the user pulls down to refresh, so that the user doesn't always see the same comments of the videos. 

## Structure

The app has 3 views and a settings screen.

### Home View

This is the view where the comments fetched from the internet are displayed. Every time the user refreshes the page, the comments of another video are displayed. On his wish, he can save the comments by double tapping.

## Saved View

Here, the saved comments are displayed in a list.

## Channels View

This view enables the user to add new channels and to manage the already added channels