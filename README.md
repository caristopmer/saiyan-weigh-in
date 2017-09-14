# Saiyan Weigh-In

**Project hosted on Heroku: [Saiyan Weigh-In](https://saiyan-weigh-in.herokuapp.com/)**

### Project Description

Saiyan Weigh-In is a weight loss and general fitness tracking application. Users can enter their weight each day and see their progress charted over time. Users may also complete 30-second "heats" of push ups as an additional means of tracking general fitness improvement.

An additional feature (and the inspiration for the name and theme of the application) is the ability for users to calculate their "power level" on any particular day. On top of simply logging weight and push up ability, I wanted there to be some other metric to provide to users with additional feedback on their fitness progress. Power level is calculated by taking into account the user's body mass index (BMI) and the average number of push ups completed during the most recent push up heat entry.

The multiple number of statistics being tracked is meant to provide users with lots of feedback in order to keep them motivated on their fitness journey. The application promotes the practice of weighing in every day, which anyone who has battled with weight loss before can attest can be very defeating as our weight naturally fluctuates a lot from day to day. However, Saiyan Weigh-In makes use of logging users' moving averages of weight, push ups, and power level so that downward or upward trends can be more easily observed and provide the user with the comfort that their efforts are not in vain when they have a bad day on the scale or in the gym.

Users are also given the ability to create or join teams for those who perform better when accomplishing a goal together with others. Team members will have their total weight loss displayed next to their username on the Team profile page, and the total weight lost by the team as a whole is proudly displayed as well.

### Features Still to Add:

* Make power level calculation be optionally performed when user submits a new heat entry.

* Add further functionality and chart display for team statistics.

* Utilize javascript to perform weight, heat, and power level entries more fluidly without page refresh; make the user profile a single page application.

* Overhaul of application front-end to be more fluid and utilize a CSS framework, or potentially explore React.

* Implement continuous integration and write unit tests to ensure back-end functionality.

* Re-factor back-end code following implementation of testing for more elegance and simplicity.

* Accompanying mobile application.

### About

The theme of this application is derived from the the television series *Dragon Ball Z*. I wouldn't call myself a current fan of the series, but I remembered it from when I was a child. The idea for the name and theme of this project came from the show and my desire to include the additional power level metric to measure users' progress. More information about the show and what a power level is can be found [here](http://dragonball.wikia.com/wiki/Power_level).

Saiyan Weigh-In is an ongoing project created by Chris McMenomy. Built with Ruby on Rails, JavaScript/jQuery, Chartkick, and deployed with Heroku.
