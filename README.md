# words_of_love

A small and simple flutter project with the goal of displaying cute comments that can be found under lofi videos on youtube.

## Idea

The user can "subscribe" to his favourite youtube channels. After that, he can cycle through the top comments of each video and save the ones he likes. A list with every video of every channel is kept somewhere and shuffled each time the user pulls down to refresh, so that the user doesn't always see the same comments of the videos. 

## Structure

The app has 3 views and a settings screen.

### Home View

This is the view where the comments fetched from the internet are displayed. Every time the user refreshes the page, the comments of another video are displayed. On his wish, he can save the comments by double tapping.

### Saved View

Here, the saved comments are displayed in a list.

### Channels View

This view enables the user to add new channels and to manage the already added channels

## Project structure 

```
lib
 ┣ src  : Relevant source files dor the app
 ┃ ┣ components     : Reusable Widgets
 ┃ ┃ ┣ channel_card.dart
 ┃ ┃ ┣ comment_card.dart
 ┃ ┃ ┣ crazy_app_bar.dart
 ┃ ┃ ┗ search_bar.dart
 ┃ ┣ constants      : Values that don't change
 ┃ ┃ ┣ const_functions.dart
 ┃ ┃ ┗ const_values.dart
 ┃ ┣ controllers    : Functions that help processing the given data
 ┃ ┃ ┣ channel_controller.dart
 ┃ ┃ ┣ comment_controller.dart
 ┃ ┃ ┗ video_controller.dart
 ┃ ┣ models         : Representation of the data
 ┃ ┃ ┣ author.dart
 ┃ ┃ ┣ author.g.dart
 ┃ ┃ ┣ channel.dart
 ┃ ┃ ┣ channel.g.dart
 ┃ ┃ ┣ comment.dart
 ┃ ┃ ┣ comment.g.dart
 ┃ ┃ ┣ video.dart
 ┃ ┃ ┗ video.g.dart
 ┃ ┣ screens        : Every screen has a new scaffold
 ┃ ┃ ┣ main_screen.dart
 ┃ ┃ ┣ search_channel_screen.dart
 ┃ ┃ ┗ settings_screen.dart
 ┃ ┣ services       : Fetching or saving the data
 ┃ ┃ ┣ boxes.dart
 ┃ ┃ ┣ comment_checker.dart
 ┃ ┃ ┣ invidious_api_helper.dart
 ┃ ┃ ┗ invidious_instance_manager.dart
 ┃ ┣ views          : The three tabs
 ┃ ┃ ┣ channels_view.dart
 ┃ ┃ ┣ home_view.dart
 ┃ ┃ ┗ saved_view.dart
 ┃ ┗ app.dart
 ┗ main.dart

```
