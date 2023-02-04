# Catinder

It's like Tinder, but with cats

## About

This project is a simple demo Flutter application.

An application shows a picture of a cat (courtesy of https://placekitten.com), and a user can choose
whether they like the cat or not. Regardless of their opinion, the app will switch to a new cat's
image, but in case of dislike the app will remember the choice and will not show the picture
anymore. The cats are always shown in the same order, except for disliked cats that will be skipped.
The user can also reset the dislikes, in which case the app will "forget" all disliked images and
will start showing the cats from the very first one. Also, due to hardware limitations the app has
not been tested on iOS (only on Android)

## Future development

The app has a lot to improve in the future (mostly because this is my first experience in Flutter).
The list of future improvements includes but is nt limited to:

* Proper DI to avoid dependency chains
* Better UI (and especially placeholder/loading animations, now the layout is a bit jumpy)
* Better tests (e.g. at this moment the project has zero integration tests)
* Better persistent storage system (SharedPreferences work just fine for key-value pairs, but the
  current solution is not scalable)
* Better project structure (e.g. main.dart is pretty messy now for such a small project)
* Handling of corner cases (connection error, backend down, etc)
* Allow users to upload their own images to private library

[device-2023-02-04-062601.webm](https://user-images.githubusercontent.com/10089784/216748415-fa95373b-2d9f-48f4-a284-4355c3010549.webm)

