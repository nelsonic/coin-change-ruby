## A Simple Solution to the Coin Change Problem written in **Ruby** (Rspec):

This an **absolute basic** *Computer Science* problem that I just never 
(made time to) *solve* by writing code ...

Conceptually, its *obvious* (once you understand it!), but actually *using* the (Programming) Language 
to *solve* it is a surprisingly good (almost *therapeutic*) exercise ... **Try it**!

### Summary of the Problem:

1. Given an *input* **amount** of Money

2. Return the *smallest number* of **coins** that for the amount (as an *array*)

#### More Background:

- http://en.wikipedia.org/wiki/Coin_problem and
- http://www.algorithmist.com/index.php/Coin_Change

#### Example:
if we *input* **6** (cents)
should get **One Nicle** (5 Cents) *and* **One Cent**
or in **array** format **[5,1]**

( Using American Coins here: http://en.wikipedia.org/wiki/Coins_of_the_United_States_dollar )

The way we *"test"* the returned amount using **Rspec** by writing a *Unit Test*:

    it "returns [5, 1] for 6" do
        expect(subject.change(6)).to eq [5,1]
    end

#### Explanation: 
With this *test* we are saying **it** (the function/method) will return a **result [5,1]** for **input 6**
then we write an *"Expectation"* to test this.

**expect(**    - setting up an *expectation* for the *result* we are going to get back from calling the change *method*

**subject.change(**    - calling the *method* **Change.change** with a specific amount (the *argument* or *parameter*)

**6**)     - the amount of money we want the Change.change method to find the number of coins for.

**).to eq**    - to equal we expect the result of subject.change(6) *to equal* the array [5,1]

**[5,1]**    - this is the result we expect from calling the subject.change method with amount *6 cents*


Putting it *all together*: we **expect** the *result* from the **change** *method* *to equal*  **[5,1]**  or  [5 cents, 1 cent] when we *input*  **6** *cents*.


**Note**: **subject** is a *shorthand* for calling the *Class* **Change**. 

We can do this becaue we *described* the group of tests as **Change** above ( **describe Change do** )
this means we are testing the Change *Class* in our Unit tests.

So when we call *subject.change* we are indirectly calling the Change.chage method.

#### Run It Yourslef:
To run this script from the command line simply issue the command:

    $ git clone https://github.com/nelsonic/coin-change.git
    $ cd coin-change
    $ bundle                 # this will install rspec if you don't already have it
    $ rspec change_spec.rb   # run the tests

( note you will need to have **ruby** and **rspec** *installed* on your machine for this to work )


You will see output in your Terminal:

        Remaining Amount: 1 | Coin: 1
        Amount 1 >> Coins: [1]

        .Remaining Amount: 4 | Coin: 1
        Amount 4 >> Coins: [1, 1, 1, 1]

        .Remaining Amount: 6 | Coin: 5
        Remaining Amount: 1 | Coin: 1
        Amount 6 >> Coins: [5, 1]

        .Remaining Amount: 48 | Coin: 25
        Remaining Amount: 23 | Coin: 10
        Remaining Amount: 3 | Coin: 1
        Amount 48 >> Coins: [25, 10, 10, 1, 1, 1]

        .Remaining Amount: 142 | Coin: 100
        Remaining Amount: 42 | Coin: 25
        Remaining Amount: 17 | Coin: 10
        Remaining Amount: 7 | Coin: 5
        Remaining Amount: 2 | Coin: 1
        Amount 142 >> Coins: [100, 25, 10, 5, 1, 1]

        .Remaining Amount: 291 | Coin: 100
        Remaining Amount: 91 | Coin: 50
        Remaining Amount: 41 | Coin: 25
        Remaining Amount: 16 | Coin: 10
        Remaining Amount: 6 | Coin: 5
        Remaining Amount: 1 | Coin: 1
        Amount 291 >> Coins: [100, 100, 50, 25, 10, 5, 1]


#### Discussion:
I solved using a couple of different approaches. 

The solution in **change_spec.rb** is elegant and simple to understand.

The only "complexity" is the .inject(:+) method which adds the items in the coins array together 
to do a quick-sum check and subtract this *running total* of coins from the original amount.

### Alternative Solutions:
- Two (separate) methods: https://gist.github.com/4570492
- Two Nested Until Loops (recursive): https://gist.github.com/4570556
- One .each Loop, Subtraction AND Division (a bit fancier): https://gist.github.com/4570709
- 5 - Liner (compressed method to single line - unmaintainable!): https://gist.github.com/4570855

### Further Reading / Learning

- *Try Ruby*! http://tryruby.org/ ( if you haven't already, *Make Time*! )
- Understand *Rspec*: http://stackoverflow.com/questions/201385/getting-started-with-rspec-looking-for-tutorials
and http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
