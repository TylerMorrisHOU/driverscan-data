# driverscan-data

driverscan was a project at the 2017 Houston Hackathon. The object of the Houston Hackathon (as 
with most hackathons) is to develop a tech solution that makes Houston a better place to live 
in some way, shape, or form.

This group chose to work toward a solution to the problem of distracted driving by developing 
an application that would send a voice alert to drivers when they entered one of the most 
crash-prone areas of Houston, reminding them to pay attention to the road.

The code found in this repository was used to:
- Identify the most crash-prone areas using a dbscan clustering algorithm
- Append the clusters to the points within them and write the modified table to a csv file for app development
- Generate a 2D heat map of the identified clusters
