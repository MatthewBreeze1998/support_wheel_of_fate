# support_wheel_of_fate
###  Requirements
* Flutter version 2.2.0
* typeScript version Version 4.5.2



## Soloution
Support wheel of fate is a web and mobile application that will select at random 2 engineers from a list with a set of rules to follow. The application is composed of 2 different languages the front end runs on dart a language from google whereas the backend APIs and database are written in typeScript.



#### Rules

*	An engineer can do at most one-half days shift in a day
*	An engineer cannot have half days shifts on consecutive days
*	Each eligible engineer should have completed one whole day of support in any two (2) week period.


#### Stack

| Frontend      | Backend       | Database   |
| ------------- |:-------------:| ----------:|
| Dart          | typeScript    | typeScript |
| Flutter       |               |            |

## How to run
Follow these steps to get the project running on your local machine
#### Server
```
git clone 
cd support-wheel-of-fate/Backend
npm run dev
```
#### Frontend
```
git clone 
cd support-wheel-of-fate/
flutter clean
flutter pub get 
cd lib
flutter run <path to main.dart in lib directory>

```

## Design approach
When designing the application I used the waterfall development method. the waterfall development method can often be rigid however this project has clear and definitive rules and deliverables, making it fit the methodology better. when setting out the application I chose the break it down into 3 different components: frontend,   backend and database. doing so gave me clear goals for each section and helped clarify their functions. When developing the features I used a tracer bullet approach to help get code the working faster, although this led to some refactoring, however, this is typical with this approach.






