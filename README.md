# NYC Vehicle Collision Prediction

# Selected Topic
The goal of this project is to predict the number of accidents that will occur during the year 2018 by training a machine learning model that will read in data from the years 2016 – 2017.

# Questions to be answered
Additionally, we want to determine during which periods of time do accidents occur more, as well as finding which borough is more dangerous to drive. Answering the above questions can provide insights on how often and where accidents will happen in the nearby future. This can be used to help the NYPD and local agencies to draft out solutions to prevent future accidents.

# Description of the data
To determine the above, we will use the “Motor Vehicle Collisions – Crash” dataset provided by the NYPD which is updated weekly with collision reports for over $1000 or injuries or fatalities have occurred. The dataset includes 1,935,922 rows of information for the years 2012, and 2016-present including information such as time of incident, location, injuries, fatalities, and cause of the accident.

Link to dataset: https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95

# Communication Protocol

We will communicate through Slack during class hours as well as when needed. We will discuss challenges that are being faced for each deliverable.

# Current roles

- Sam: Circle
- Yuyu: Triangle
- Daniel: Square
- Subrata: X


# Database

To store our we are using the pgAdmin 4 software to create a PostgresSQL database. In a python script we cleaned the original data into three separate data frames. The first data frame included the Collision ID, the Number of Persons Injured, and the Number of Persons Killed. The second data frame included the Collision ID, the BGorough, and the Zip Code. The third data frame included the Collision ID, the Crash Date, and the Crash Time. Each data frame was cleaned to remove null values from the dataset. These data frames were then uploaded to the PostgresSQL database as tables labeled, "collisions", "locations", and "date_time" respectively. 



# Machine Learning Model

For our machine learning model, we will be using two multilinear regression models. One model will in charge of predicting the total number of fatalaties and the other will predict the total number of injuries. For both models we will be using the time and borough as input features.

![image (1)](https://user-images.githubusercontent.com/85198012/196573742-1faede1b-da30-4511-9aa1-ab8bbb4c9b9e.png)




