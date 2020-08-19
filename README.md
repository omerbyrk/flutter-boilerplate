# Flutmovie Boilerplate Project

A boilerplate project created in flutter using Bloc Statemanagment

# How to Use

<b>Step 1:</b>

Download or clone this repo by using the link below:

<code>https://github.com/omerbyrk/flutmovie-boilerplate.git</code>

<b>Step 2:</b>

Go to project root and execute the following command in console to get the required dependencies:

flutter pub get 

<b>Step 3:</b>

This project uses inject library that works with code generation, execute the following command to generate files:

<code>flutter packages pub run build_runner build --delete-conflicting-outputs</code>

or watch command in order to keep the source code synced automatically:

<code>flutter packages pub run build_runner watch</code>

<b>Step 4:</b>

This project also uses extensions future in dart. In case, If it doesn't work, you need do run the below code in project root.

<code> dartanalyzer .</code>
