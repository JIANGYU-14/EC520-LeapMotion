# Virtual Shape Recognition Using Leap Motion

### Platform and Tools
Windows 64-bit Operating System or Mac OS, Visual Studio, Matlab, Python

### Components Description
* Fetching raw data from Leap-Motion Controller see file in Fetching Data folder
* Trimming raw data see file in Trimming Data folder
* Recognizing data see file in Manipulating Clean Data folder 

## Project Summary

Leap Motion is a new sensor capable of precisely tracking hand movement in a volume of about one cubic foot, and similar to Kinect camera at some extent. It holds the potential to revolutionize the way we interact with computers. The project is about using Leap Motion Controller to tracking the hand movement in the air, forwardly, displaying and recognizing corresponding shapes.

Initially, the developed algorithm is able to differentiates basic geometric shapes, such as triangle, square and circle, by finding the extinct pattern features among these figures. In another words, once a new shape added into the system, a set of new rules should be applied to distinguishing the shapes, which is not practical and effort costly.

Therefore, a scalable system is in need, so the recognition algorithm was changed into data drive developing. For training material, a certain amount of different shapes has been imported into system as predefined classes, and once a visually same shape been used as testing material, it will be shifted and scaled to find the Euclidean distance to each existed shapes in system by implementing the Nearest-Neighbor algorithm. Classifier like Support Vector Machine is out of box given the data limitation. And the feature vector used here is the spatial coordinates of hand in each frame, which extracted from Leap-Motion controller at a frame bases.

At the end, the performance of original algorithm and optimized algorithm has been evaluated. The results showed great promise of proposed solution, and the algorithm has high accuracy in recognizing the basic geometric shapes at most time, yet in random shape recognition part, while the predefined classes is similarly some way, the performance is not good, and more feature vectors should be included as future improvement.

## Implementation Details

The frame rate of Leap-Motion controller is about 120 frames per second, and each complete shape takes 5 to 6 seconds, therefore, a window size of 80 samples has been selected to sliding the sample. Larger size might results in relatively same standard deviation in all the windows.

In optimized system, Nearest-Neighbor algorithm has been implemented. And in Matlab, the corresponding method is KNNSearch(x,y), which finds the nearest neighbor in x for each point in y with default k equals 1 and value in Euclidean distance.

<img width="440" alt="2018-04-29 6 27 41" src="https://user-images.githubusercontent.com/22137277/39411585-d231b842-4bda-11e8-9a45-d5cbaee4f21f.png">

<img width="438" alt="2018-04-29 6 27 50" src="https://user-images.githubusercontent.com/22137277/39411588-d9fbe07a-4bda-11e8-935a-40a79c341d23.png">

<img width="420" alt="2018-04-29 6 27 33" src="https://user-images.githubusercontent.com/22137277/39411589-ddd572ec-4bda-11e8-802f-8b54faa13461.png">

