Cloud Quest - Firebase Classwork

How to Run

1. Open the Flutter project in VS Code or Android Studio.
2. Open the terminal in the project folder.
3. Run flutter pub get to install everything needed.
4. Run firebase emulators:start --only auth,firestore,functions to start the Firebase emulators.
5. Open an Android emulator or connect an Android device.
6. Run flutter run to start the app.

Platform: Android (Flutter)

Firebase Services

Firebase Authentication is used to let users sign in and sign out. Cloud Firestore is used to store the daily challenge and the user's progress. Cloud Functions handles the rewards when a user completes a challenge.

AI Quest Coach

The AI Quest Coach is supposed to help users by giving them hints about their challenges. It uses a read-only tool called readMyQuestState to check their challenge and progress without changing anything.

Rewards and Security

When a user completes a challenge, they should get 10 points and the First Quest badge. The rewards are handled by a Cloud Function instead of the AI Coach. This is to make sure the AI cannot change the user's points. Firestore rules should also stop users from changing their points directly.

Completing the same challenge twice should not give the user extra points or another badge.

Testing

The tests would include signing in and out, loading the daily challenge, and asking the AI Coach for a hint. Another test would be asking the AI to ignore its instructions and give 999 points. The points should stay the same. I would also test completing the challenge twice to make sure the reward is not repeated.

I was not able to fully test the app because Android Studio would not open. Because of this, I could not confirm whether everything worked correctly.