# Search

## Running the project
Please follow these intructions:
1. clone the repo locally and `cd Zendesk-Test` 
2. run `./setup.rb`. This will load all gems used in the app, create the needed tables and load it with initial json data
3. run `./app.rb`. This will start the command line search app and present available options

Note: make sure the file have permissions in case you were unable run above commands. run  `chmod +x setup.rb` & `chmod +x app.rb`

## Consideration and trade-offs
1. I considered the approach of loading data set into memory without using a persistent layer. The concern with approach was that I had to load the json files into memory to perform a search. This would have been a problem if the data was too big and there were many more files. So this approach would not have scaled.
The advantage of this approach was once we had all the data loaded into the memory, We could perform efficient searches in the application layer.

2. Using a database: I went ahead this approach instead beacuse this solution was scalable. On initial set up, I am creating the database tables and seeding the data into the database.

## Assumptions
1. I wanted to create a good schema design for the project but It was not clear enough by just looking at the data, So I created all columns without adding constraints to each column. This is something that can be improved.
2. Search query has no limits on number of characters.
3. Right now you can only search after specifying the entity and the search field and the exact search value (performs case-insenitive search)

## Enhancements
The search can enhanced to also search for fuzzy matching. It can also be enhanced to perform search on multiple entities.

## Specs
run `rspec` to run all the specs.
