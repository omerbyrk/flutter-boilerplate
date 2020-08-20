# Flutmovie Boilerplate Project
A flutter boilerplate project can be used both <b>enterprise</b> & <b>individual</b> application.

>>>>>>>>>>>>>>> ---
## Getting Started

<dl>
  <dt><b>Enterprise & Individual App </b></dt>
  <dd>Presents minimal requirement for creating a new enterprise & individual application.</dd>
  <dt> <b>Domain-driven design </b></dt>
  <dd>Has been developed by using Domain-driven design concept. </dd>
  <dt> <b>Clean & Doc-commented</b> </dt>
  <dd>Has a clean architecture, and is doc-commented for the most class in it.  </dd>
  <dt> <b>BLoC state managment</b> </dt>
  <dd>Uses a BLoC state managment which is recommended by Flutter.</dd>
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

`flutter packages pub run build_runner build --delete-conflicting-outputs`

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
>>>>>>>>>>>>>>> ---

## Folder Structure

Here is the lib folder which contains the main code for the application.

`lib/` <br />
`|- core/`<br />
`|- data/`<br />
`|- domain/`<br />
`|- presentations/`<br />
`|- dependency_injection.dart` <br/>
`|- main.dart` <br/>

<br />
<code>
core -  contains the objects that is used all across the application. 
</code>
<br />
<code>
data (layer) -  contains the services, databases and shared preferences of your project. </code>
<br />
<code>
domain (layer) - contains the usecases, repositories and entities of your project.
</code>
<br />
<code>
presentation (layer) -  contains the pages and Blocs of your project.
</code>

>>>>>>>>>>>>>>> ---
<br />

## Core Folder
<br />

`core/`<br />
`|- blocs/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- auhentication/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- authentication_bloc.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- authentication_event.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- authentication_state.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- index.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- bases/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- bloc_base.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  `|- bloc_event_base.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  `|- bloc_state_base.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- bootstart/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  `|- boostart_bloc.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- boostart_event.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- boostart_state.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- index.dart/` <br/>
`|- consts/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- app_consts.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- enums.dart`<br />
`|- failures/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- failures.dart`<br />
`|- localization/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- app_localization_base.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- app_localizations.dart`<br />
`|- theme/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- app_colors.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- app_theme.dart`<br />
`|- utils/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- connectivity_utils.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- screen_utils.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- validations.dart`<br />
`|- widgets/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- app_circular_progress_indicator.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- app_fade_animation.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- ...`<br />

>>>>>>>>>>>>>>> ---
<br />

## Data Folder
<br />

`data/`<br />
`|- exceptions/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- local_server_exception.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- remote_server_exception.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- sharedpref_exception.dart`<br />
`|- local/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- datasources/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- user_local_datasource.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- ...` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- local_consts.dart`<br />
`|- models/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- model_Base.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- user_model.dart`<br />
`|- network/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- datasources/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- ...` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- api_datasource_base.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- dio_client.dart`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- network_consts.dart`<br />
`|- sharedpref/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- datasources/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- authentication_datasource.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- sharedpref_consts.dart`<br />
>>>>>>>>>>>>>>> ---
<br />

## Domain Folder
<br />

`domain/`<br />
`|- entities/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- user_entity.dart` <br/>
`|- repository/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  `|- authentication_repository.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  `|- repository.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  `|- repository_utils.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- user_repository.dart` <br/>
`|- usecases/`<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- authentication/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- clear_token.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- get_token.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- is_authenticated_user.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- set_token.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- user/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- do_login.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- get_user_by_token.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- usercase.dart` <br/>

>>>>>>>>>>>>>>> ---
<br />

## Presentation Folder
<br />

`presentations/`<br />
`|- home/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- bloc/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- home_bloc.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- home_event.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- home_state.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- index.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`|- pages/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- home_page.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- widgets/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- home_page_bottom.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- home_page_top.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- index.dart` <br/>
`|- login/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- bloc/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- login_bloc.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- login_event.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- login_state.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- index.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- cubit/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- login_form_field_cubit.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- login_form_field_state.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- pages/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- login_page.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- widgets/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- login_page_form.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- login_page_form_title.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- login_page_form_top.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- index.dart` <br/>
`|- splash/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- cubit/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- splash_cubit.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- splash_state.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- pages/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- splash_page.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- widgets/` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- splash_page_app_signature.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- splash_page_logo_widget.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- splash_page_message_widget.dart` <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `|- index.dart` <br/>









