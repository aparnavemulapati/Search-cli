# Ruby CLI Search Application

This is a simple command line application written in Ruby, which searches data in JSON files.
Since there are multiple searchable fields and the dataset is not sorted, we use linear search to find the results in O(n) time. The searchable JSON files are
  - users.json
  - tickets.json
  - organizations.json

our search CLI will be able to handle increase in amount of data ~10000+ rows. So, its extensible.

# Get Started
You Ruby version must be `>= 2.3.0`
This application does not required any other dependencies.

### Running Tests
```
ruby tests/suite.rb
```

### Search in action
```
ruby main.rb
```
You'll then be presented with an interactive menu:
```
Type 'quit' to exit anytime, Press 'Enter' to continue
Select an option:
* Press 1 to search
* Press 2 to view a list of searchable fields
* Type 'quit' to exit
```

After this, the navigation is guided and can handle any errors( robust ). 
