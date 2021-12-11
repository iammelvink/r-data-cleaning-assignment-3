# r-data-cleaning-assignment-3

## CodeBook for my Getting and Cleaning Data Course Project on Coursera

### Source Data

Data and description can be found here [Human Activity Recognition Using Smartphones](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 'Human Activity Recognition Using Smartphones')

### Data Set Information

The trials were carried out on a group of 30 participants ranging in age from 19 to 48 years old. Each participant wore a smartphone (Samsung Galaxy S II) around their waist and did six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING). We recorded 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz using the device's internal accelerometer and gyroscope. The tests were videotaped so that the data could be manually labelled. The collected dataset was randomly partitioned into two sets, with 70% of the volunteers being chosen to provide training data and 30% being chosen to generate test data.

The sensor signals (accelerometer and gyroscope) were pre-processed using noise filters before being sampled in 2.56 sec fixed-width sliding windows with 50 percent overlap (128 readings/window). A Butterworth low-pass filter was used to split the sensor acceleration data into body acceleration and gravity, which had both gravitational and body motion components. Because only low frequency components of the gravitational force are expected, a filter with a cutoff frequency of 0.3 Hz was chosen. By computing variables in the time and frequency domain, a vector of features was generated for each window.

### Attribute Information

The following information is supplied for each record in the dataset:

- Accelerometer triaxial acceleration (total acceleration) and estimated body acceleration
- The gyroscope's triaxial angular velocity.
- A 561-feature vector containing variables in the time and frequency domains.
- The name of the activity.
- A unique identity for the person who conducted the experiment.
