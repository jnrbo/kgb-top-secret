# A Dealer For the People

This is a secret project from KGB to analyze reviews from McKaig Chevrolet Buick - A Dealer For The People


Requirements
------------

- Ruby 2.7.0
- Bundler 2.1.2

Install
------------

To install all dependencies necessary to run the project, execute:

```shell script
bundle install
```


Running the Scraper
------------

```shell script
rake analyzes
```


Running Tests
------------

```shell script
rspec
```

To open coverage just type `open coverage/index.html` 


Overly Positive criteria
------------
To identify the most overly positive reviews, a score it's calculated based on how long is the review along with how many "overly positive" words it has.
Each word has a weight that influences the score.

Equation:

![equation](equation.png)

```text
x = score
n = number of occurrences of the word in text
w = weight
l = text length
```