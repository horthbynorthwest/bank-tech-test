# Bank Tech Test
This is my first tech test of week 10. I have elected to write this in Ruby as a way to consolidate my knowledge of the language. 

## Quick Start
Clone, then:
```
$ bundle install
$ rspec
```
You should see 14 passing rspec tests.

---
#### To use in irb
```
$ irb -r './lib/bank_account'
```
Then create a new instance of the bank account class and all the methods to meet the criteria will be available to you.

## Approach

I broke this down into [User Stories](#User-Stories) to help guide my process. From there I planned out what would be needed using a class diagram.

<img width="317" alt="Class diagram" src="https://user-images.githubusercontent.com/71782749/104311517-376f4500-54cd-11eb-9783-02a4c14bbd5e.png">

From there I used TDD to follow these user stories to build from the ground up one user story at a time. This allowed  me to keep my code simple and concise.

Below is a screenshot from repl that shows the balance changes & print_statement method to show the transactions.

<img width="599" alt="Screenshot 2021-01-12 at 11 54 19" src="https://user-images.githubusercontent.com/71782749/104311583-4d7d0580-54cd-11eb-9ad3-5b1542df9e9d.png">

## Gems
For this tech test I'll be using the following gems to ensure high code quality
|Gem| Use|
|--|--|
|Rspec |I'll be using TDD & rspec is the testing library I'm most comfortable with |
|Simple-cov| Ensures that I can prove a high test coverage|
|Rubo-cop | A Ruby linter|
|Bundler| Easy way to package & install dependencies


## Specification
Below are the requirements and acceptance criteria, taken from [here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md). 
###  Requirements

-   You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
-   Deposits, withdrawal.
-   Account statement (date, amount, balance) printing.
-   Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given**  a client makes a deposit of 1000 on 10-01-2012  
**And**  a deposit of 2000 on 13-01-2012  
**And**  a withdrawal of 500 on 14-01-2012  
**When**  she prints her bank statement  
**Then**  she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User Stories

From the above specs I created my own users stories to help guide me.

```
As a User,
So I can have a place to keep money,
I want to be able to open an account.

As a User,
So I can save money,
I want to be able to deposit money into my account.

As a User,
So I can access my money,
I want to be able to withdraw money out of my account.

As a User,
So I can see how much money I have in my account,
I want to be able to see my balance.

As a User, 
So I can see my account history,
I want to be able to see a statment.

As a User,
So I can get clarity,
I want to be able to see dates attached to my statement.

As a User,
So I can get clarity,
I want to be able to see separate columns for credit/debit.
```
