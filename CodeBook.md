# Code Book

## Data Description
The data set includes measurements from smartphone accelerometers used for human activity recognition.

## Variables
- subject: Subject ID (integer).
- activity: Activity name (walking, standing, etc.).
- TimeBodyAccelerometerMeanX: Mean of Time Domain Body Accelerometer Signal in X direction.
- (and so on for each measurement.)

## Transformations
- Training and test datasets merged.
- Only mean and standard deviation measurements kept.
- Activities labeled with descriptive names.
- Variables renamed to be more readable.
- Created an average of each variable for each activity and subject.
