```
________________   ______  ___     ______ ___________     
__  ___/_  ____/   ___   |/  /________  /____(_)__  /____ 
_____ \_  / _________  /|_/ /_  __ \_  __ \_  /__  /_  _ \
____/ // /___/_____/  /  / / / /_/ /  /_/ /  / _  / /  __/
/____/ \____/      /_/  /_/  \____//_.___//_/  /_/  \___/ 
                                                          
```

This is the flutter project which makes up both the android and iOS sustainable citizen apps

To learn more about fluter, check out this link: https://flutter.io/

# Getting Started

## Installation 

To get glutter installed on your machine, follow the appropriate steps found at the following link: https://flutter.io/get-started/install/

After this, ensure that you are working on the `beta` channel by typing the command `flutter channel`

If you are currently on the `dev` or `master` channel, make sure you switch to the `beta` channel by entering the command `flutter channel beta`

You can then follow the following guide to get your IDE of choice set up: https://flutter.io/get-started/editor/#vscode

## !!!Temporary Workaround!!!

When I was setting up the hello world flutter app I stumbled accross an issue currently present in the `beta` channel of flutter which will cause any android builds to fail. 

The current fix is to go edit the file `$flutterRoot/packages/flutter_tools/gradle/flutter.gradle` and add `google()` to the top of the repository list. In the end the `buildscript` object should look something like this:

```
buildscript {
    repositories {
        google()
        jcenter()
        maven {
            url 'https://dl.google.com/dl/android/maven2'
        }
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:3.1.2'
    }
}
```

The issue is currently being resolved through the following [github PR](https://github.com/flutter/flutter/pull/23397) and has actually been merged into the master branch, however from the discussion, it doesn't look like this will be back ported into the current beta release. Until the next beta comes out with this fix, this workaround will have to do as the master branch is far too unstable to work on. 