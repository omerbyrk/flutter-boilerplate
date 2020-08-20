# Flutmovie Boilerplate Project
A flutter boilerplate project can be used both <b>enterprise</b> & <b>individual</b> application.

>>>>>>>>>>>>>>> ---
## Getting Started

<dl>
  <dt><b>Enterprise & Individual App </b></dt>
  <dd>Presents minimal requirement for creating a new enterprise & individual application.</dd>
  <br />
  <dt> <b>Domain-driven design </b></dt>
  <dd>Has been developed by using Domain-driven design concept. </dd>
  <br />
  <dt> <b>Clean & Doc-commented</b> </dt>
  <dd>Has a clean architecture, and is doc-commented for the most class in it.  </dd>
  <br />
  <dt> <b>BLoC state managment</b> </dt>
  <dd>Uses a BLoC state managment which is recommended by Flutter.</dd>
  <br />
  <dt> <b>Responsive Degisn</b> </dt>
  <dd>Supports responsive mobile design, and compatible every device even tablet!</dd>
</dl>

>>>>>>>>>>>>>>> ---

## How to Use

### Step 1:
Download or clone this repository by using the link below:

> [https://github.com/omerbyrk/flutmovie-boilerplate.git](https://github.com/omerbyrk/flutmovie-boilerplate.git)

### Step 2:

Go to project root and execute the following command in console to get the required dependencies:

`flutter pub get`

### Step 3:

This project uses inject library that works with code generation, execute the following command to generate files:

`lutter packages pub run build_runner build --delete-conflicting-outputs`

or watch command in order to keep the source code synced automatically:

`flutter packages pub run build_runner watch`

### Step 4:

This project also uses extensions feature in dart. In case, If it doesn't work, you need do run the below code in the project root.

`dartanalyzer .`

>>>>>>>>>>>>>>> ---

## Boilerplate Features


* Splash
* Login
* Home
* Bloc Statemanagment
* Provider (State Management)
* Responsive
* Theme
* Dio
* Database
* Connectivity Support
* Validation
* Dependency Injection
* Responsive Support
* Multilingual Support
* A project example

>>>>>>>>>>>>>>> ---
## Multilingual And Responsive  Support
![IphoneTable](https://media.giphy.com/media/h4wzDbG3GPzCkyLOW6/giphy.gif)
![IphoneTable](https://media.giphy.com/media/KffxSFEsf0qJ65CEYC/giphy.gif)
>>>>>>>>>>>>>>> ---

## Folder Structure

Here is the lib folder which has the main code for the application.

`lib/` <br />
`|- core/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- blocs/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- auhentication/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- bases/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- bootstart/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- consts/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- failures/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- localization/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- theme/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- utils/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- widgets/`<br />
`|- data/`<br />
`|- domain/`<br />
`|- presentation/`<br />

### core

`core/` <br />









