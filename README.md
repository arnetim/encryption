# Workshop encryption
Arne Timmerman, March 27th 2014

A hands-on workshop encryption. The workshop contains of 4 exercises.

1. **Symmetric encryption**. In the first exercise you'll learn the basics of symmetric encryption. With a little bit of help from a cryptography library you will implement a decrypt 'algorithm'.
2. **Asymmetric encryption**. The next step is asymmetric encryption. You'll implement the encrypt and decrypt 'algorithms'.
3. **Encrypt personal details with a password**. We'll take cryptography a step further by applying symmetric encryption for storing personal data in a 'database'. To demonstrate how this works you'll implement some parts of an application.
4. **Share a content key**. Exercise 4 is en extension to exercise 3 in which we'll implement sharing a 'content key'. This key can be used to make encrypted personal data available to other users of the application.

The exercises can be implemented in Java or Ruby. Each exercise consists of a failing test and some todo's in the associated application code. **Important note**: you should never have to change the tests. Just make them pass :)


## Installation instructions

The exercises are implemented using the cryptography library NaCl, Networking and Cryptography library: http://nacl.cr.yp.to/. For this workshop we'll use the portable fork libsodium: https://github.com/jedisct1/libsodium. To install the library on OS X you can use Homebrew:

    brew install libsodium

### Java

The Java code is provided with a Maven build file. You can run the tests as follows:

    mvn clean install

If you like to use Eclipse then you can create the project files like this:

    mvn eclipse:eclipse

### Ruby

The Ruby code is accompanied by a Gemfile, use bundler for installing the required gems:

    brew install ruby
    gem install bundler
    bundle install

All tests are implemented in rspec. Run the test as follows:

    bundle exec rspec


## Tips

* If you want to make sure that your set-up is correct: checkout the 'solutions' branch and run all the tests. All tests should pass.
* The code is provided with TODO comments.
