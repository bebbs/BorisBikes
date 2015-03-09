Boris Bikes
====================

**Makers Academy Week 1 Challenge**: Design and implement the classes and methods needed for a system similar to the TfL Cycle Hire scheme. 

I undertook this project to gain a better understanding of Object-Oriented Design, domain modelling, and test driven development. In addition to achieving these goals, I learnt the basics of using modules to avoid repetition and encourage reusability throughout my code.

##Technologies
- Ruby
- RSpec

##How to install
- Clone this repo to your computer

```
git clone https://github.com/bebbs/BorisBikes.git
cd BorisBikes
```
- Run `rspec` to run the RSpec test suite.


##Class Responsibility Collaboration Cards

###Class - Bike

Responsibilites             | Collaborators
----------------------------|------------------
Be rented                   | User, Station
Be returned                 | User, Station, Van
Be broken                   | User
Be fixed                    | Garage
Be held                     | Garage, Van, User, Station
Be moved                    | Van, User

### Class - Station 

Responsibilites         |Collaborators
------------------------|------------------
Hold                    | Bike
Receive                 | Bike, User, Van
Eject                   | Bike, User, Van

### Class - Van 

Responisibilites        |Collaborators
------------------------|------------------
Receive                 | Bike, Station, Garage
Eject                   | Bike, Station, Garage
Hold                    | Bike
Move                    | Bike, Station, Garage

### Class - Garage 

Responisibilites        |Collaborators
------------------------|------------------
Hold                    | Bike
Fix                     | Bike
Receive                 | Bike, Van
Eject                   | Bike, Van
