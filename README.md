# Enigma

This project encrypts and decrypts messages as the command line. It utilizes a shift which consists of a **key** shift and a **offset** shift which are added into **shift**. The shift then determines by how many indexes the current letter shifts. This is the high-level premise of the project. The program can handle encryption without a key or offset and will auto-generate the two. The decryption method takes the key and date to decode the message.

## Getting Started

Fork and clone this repository to your local machine 

### Prerequisites
`gem install mocha`
`gem install date`
`gem install minitest`
`gem install rake`
`gem install simplecov`

### Installing

* Once you have the repository on your local machine, open up the terminal and get into your desired IDE
* Within the structure, you'll find a message.txt file
** Open this and type in the message you want to encode

* In your terminal, run `$ ruby ./lib/encrypt.rb message.txt encrypted.txt`

* Once this is complete, go back into the file structure and find the encrypted.txt. Here you'll find the encrypted text, the key, and the date. Write down the key and the date for later.

* To decrypt the message, go back into your terminal and run `$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt ARG1 ARG2`
** ARG1 is the key in the encrypted text file
** ARG2 is the date in the encrypted text file

* Open the decryped.txt in your IDE. Here you'll find the decrypted text, the key, and the date.

## Running the tests

* Run `Rake`

## Author

* **Rostam Mahabadi**
