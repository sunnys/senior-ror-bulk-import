# Intro
This is a very basic app that holds a collection of companies data including its employee and leaves policy information. In this task, you will be required to develop new features according to the following user story.

## User story
As a user/admin, I want to be able to do bulk import by uploading a CSV file containing information of users and its policy so that I can save time onboarding users.

User can upload users data by going to a new page. This new page will have a form that has 2 form input. The first one should be a drop down of the company. The second one should be the file form input in which user/admin can select the file.

### Validation :

* Company should exist
* Should follow model validation (User and Policy)
* Only process csv file
* Reject if no csv file uploaded


### Definition of done :

* If valid file upload user should see success messages and the numbers of users imported.
* If the user tries to upload a non-CSV file, it should say  that file is invalid
* If some of the information provided within CSV file not valid (violating model validation) 
* then users should see which records are invalid along with the reasons.
* It should be able to handle thousands of records 

---

## Objective :

* Develop the feature based on the requirement/user story
* Follow best practices (coding style, security etc)
* Write test RSpec for unit and integration. Both for existing and new features.
* You may install gems that you need
* You may change the current implementation if needed
* Readme
