# Getting-and-Cleaning-Data-Course-Project
# Code to analyze accelerometer data from Samsung Galaxy S smartphones
# ==================================================================
# Coursera Data Science Specialization
# Course 3: Getting and Cleaning Data
# Week 4 Course Project

# Analysis of accelerometer data from Samsung Galaxy S smartphones
# ==================================================================

# - 'run_analysis.R' : this code downloads data from the source [URL given below] and creates a tidy data set

# Files used as inputs include:
# =========================================

# - 'features.txt': List of all features (561 total)
# - 'activity_labels.txt': Links the (numeric) activity labels with their activity name.
# - 'train/X_train.txt': Data for "training" subjects (561 columns; one for each "feature").
# - 'train/y_train.txt': Training labels; provides numeric activity labels (by row).
# - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.
# - 'test/X_test.txt': Data for "test" subjects (561 columns; one for each "feature").
# - 'test/y_test.txt': Test labels; provides numeric activity labels (by row).
# - 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample.

# Notes: 
# ======
# - Features are normalized and bounded within [-1,1].
# - Each feature vector is a row on the text file.

# The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.

# Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

# The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

# For each record it is provided:
# ======================================

# - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
# - Triaxial Angular velocity from the gyroscope. 
# - A 561-feature vector with time and frequency domain variables. 
# - Its activity label. 
# - An identifier of the subject who carried out the experiment.
