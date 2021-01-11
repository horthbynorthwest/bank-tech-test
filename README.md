# Bank Tech Test
This is my first tech test of week 10. I have elected to write this in Ruby as a way to consolidate my knowledge of the language. 


## Gems
For this tech test I'll be using the following gems to ensure high code quality
|Gem| Use|
|--|--|
|Rspec |I'll be using TDD & rspec is the testing library I'm most comfortable with |
|Simple-cov| Ensures that I can prove a high test coverage|
|Rubo-cop | A Ruby linter|






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
I want to be able to withdraw money from my account.

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

