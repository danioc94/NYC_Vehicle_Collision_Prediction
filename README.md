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


# Database

To store our data we are using the pgAdmin 4 software to create a PostgresSQL database. In a python script we cleaned the original data into three separate data frames. The first data frame included the Collision ID, the Number of Persons Injured, and the Number of Persons Killed. The second data frame included the Collision ID, the orough, and the Zip Code. The third data frame included the Collision ID, the Crash Date, and the Crash Time. Each data frame was cleaned to remove null values from the dataset. These data frames were then uploaded to the PostgresSQL database as tables labeled, "collisions", "locations", and "date_time" respectively. 

# Machine Learning Model

For our machine learning model, we will be using two random forest models. One model will in charge of predicting the total number of fatalaties and the other will predict the total number of injuries. For both models we will be using the time and borough as input features.

## Description of data preprocessing
We first start off by reading our Collision, Datetime, and Locations tables from our SQL DB and merge these onto one unique data set. While doing we also drop the Index and Collision ID columns. We then make sure we do not have any empty rows by running dropna on our dataframe. The merged dataframe after dropping the rows and columns looks like image below.

![image](https://user-images.githubusercontent.com/20058842/199558345-82de1e13-456f-4e4f-bccf-9852d3d21e2d.png)

With this initial step completed we proceed to filter our accidents that occurred during 2016-2017. We also rename the columns to shorten their names. Since Sklearn models need data in float datatypes we convert the Date and Time columns to float using np.timedelta64() which assigns unique values to each data and time on our dataset. We now have the following types:

![image](https://user-images.githubusercontent.com/20058842/199556039-3e542d38-0892-435c-90de-7915ed7a9a8f.png)

The Borough column is also converted from one object column to five different features using pd.get_dummies() which performs a "One-hot encoding" for each borough. The dataframe now looks like the following:

![image](https://user-images.githubusercontent.com/20058842/199557086-201a93b4-a897-435f-881b-af5bb9cc5eac.png)

The final step that is performed on the data before entering the model creation and traing is to scale it using StandardScaler(). This is implemented once the data has been split into training and testing.

## Description of feature engineering and feature selection, including decision making process.
After going over the original raw dataset, we noticed many columns had empty information making these useless for any analysis to be done. Since we are looking to run a model that can predict future injuries and deaths many columns such as "Latitude", "Longitude", or "Vehicle types" have meaningless information that can help build the classifier. Other feature columns such as Motorist, Cyclist, and Pedestrian are redundant since we have columns that have this overall data summed. With all this in mind, we determined the only the useful columns to be used will be "Number of Persons Killed", "Number of Persons Injured", "Crash Date", "Crash Time", "Borough", and "Zip Code".

## Description of how data was split into training and testing sets
We used sklearn.model_selection.train_test_split function with its default settings which sets training data to use 75% of the dataset while the pending 25% will be used as testing sets. The 2016 and 2017 datasets have combined 296,150 rows of examples, meaning 222,113 examples were used for training and 74,037 examples were used for testing.

For the 2018 data, out of the 149,181 accidents 25% (37,295) were used validate predictions on this year.

## Explanation of model choice including limitations and benefits
After attempting to initially use regression models to make predictions and not having relevant results, we used a Random Forest classifier since it is capable of handeling large amounts of datasets that are in tabular format. Random Forest are known to be reliable when the outcome of the predictions is not clear. It is also very fast compared to other machine learning models since it divides its training algorithm into separate trees to run several sub-processes in parallel.

## Description of trained model
The random forest model that was implemented uses Sklearn's RandomForestClassifier() which we created with an n_estimator = 128. We also set a random_state=78 to set a default value that will ensure that data thats fed will always be the same. It is also to note the we scale our input data to have better performance.

## Description of current accuracy score
For our injuries prediction model, we obtained 79% accuracy score after training with data from the years 2016-2017. We then ran predictions on 2018 data and we get 77% of accuracy which means the model was able to correctly predict 77% of accidents with injuries that had indeed had injuries.

On another hand, the deaths prediction model obtained 99% of accuracy with training data from the years 2016-2017. Validating 2018 data on this model also gave us 99% accuracy.


![image (1)](https://user-images.githubusercontent.com/85198012/196573742-1faede1b-da30-4511-9aa1-ab8bbb4c9b9e.png)


Link to Google slides: https://docs.google.com/presentation/d/1OXUMw8YbhUaa9sdmAllezaqRxmlA8wUQ_UAXln9Wo0c/edit?usp=sharing

Link to dashboard: https://docs.google.com/presentation/d/1yHUWZ7sy7ZK2-HJEY1DQaOSAP7FX2-gnOIkRsQApQBg/edit?usp=sharing

Link to Tableau Dashboard: https://public.tableau.com/app/profile/daniel.ojeda/viz/NYC_Collision_Dashboard/Dashboard1?publish=yes
