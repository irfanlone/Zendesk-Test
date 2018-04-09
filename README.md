# Search

## Running the project
Please follow these intructions:
1. clone the repo locally and `cd Zendesk-Test` 
2. run `./setup.rb` to do the initial setup
3. run `./app.rb` to start the app

Note: make sure the file have permissions in case you were unable run above commands. run  `chmod +x setup.rb` & `chmod +x app.rb`

## Consideration and trade-offs
1. Not using a database: I considered this approach initially without using a database, the concern with approach was that I had to load the json files into memory to perform a search. This would have been a problem if the data was too big and there were many more files. So this approach would not have scaled.
The advantage of this approach was once we had all the data loaded into the memory, We could perform very efficient searches and custom search by using some data structures to store the data.

2. Using a database: I went ahead this approach instead beacuse this solution was scalable. On initial set up, I am creating the database tables and seeding the data into the database.

## Assumptions
I wanted to create a good schema design for the project but It was not clear enough by just looking at the data, So I created all columns without having null validations. This is something that can be improved.
