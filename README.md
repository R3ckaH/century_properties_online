### Before Start
First you have to understand that my english is not good. Below this is the overall Flow of our app
![images](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?ssl=1)

## Step 1 - Domain Folder
This is where we will create an independent folder for presentation folder and data folder

### 1. Entities Folder - we need to make sure we have to create an object based on your api to display it later on presentation.

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/entity.png)
    
    Equatable is necessary for our state management(flutter_bloc)

### 2. Repositories Folder - we have to create an abstract class or contract that contains a method that we will need later.

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/repo.png)

    As you can see this is where we declare all the function or method that we need to this app.
    Either is one of the feature of Dartz package that we have. The purpose of either is whenever you want to return a different Object if Fail or Sucess. We will talk about the benefits of Either later in presentation folder.

### 3. UseCase Folder - we are creating 1 by 1 file for our methods on the repositories.

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/usecase.png)

    Every one of the methods are separated in file

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/usecase1.png)

    You can see the sample of the useCase implementation 

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/call.png)

    The abstract class of UseCase

## Step 2 - Data Folder
This is where we manage raw data into object.

### 1. Model Folder - This is the subclass of entities folder so we can return the same object as entity (Entity is for displaying in presentation and Model is for Fetching data and Converting raw data into Object Model).

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/model.png)

    You can see that we extends Entity which is Project in this example. also we are using fromJson and toJson here for converting.

### 2. Datasource Folder - this is the implementation of getting our api and convert it into objects model.

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/adata.png)

    Also we are using abstract just for our clean architecture pattern.

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/data.png)
![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/exception.png)

    We are now fetching the data using the http get. and as you can see we are using forEach so we can get a List of ProjectModel.
    we have to throw an exception (Server Exception)

### 3. Repositories - This is the implementation of our abstract class that we declared earlier on domain folder

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/irepo.png)

    We are now using try catch for catching an exception or trying to get the data
    In the middle of getting data you can see that we are caching it.

    Left(Failure) || Right(Success) 


![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/local.png)
 
    implementation of caching data using sharedpreferences


## Step 2 - Presentation Folder
This is our logic comes. State management is necessary for building a large application(flutter_bloc)

### 1. Cubit - We will manage the state of our app and pass the data 

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/state.png)

    First we are creating multiple state that our app needs. Remember when I said the benefits of dartz package earlier. this is the part because some of the state management are using try catch in their logic but using flutter_bloc we dont have to since we've done it on repository. All we have to do is create a multiple state.

    ----- Common State -----
    class NameInitial extends NameState{}
    class NameLoading extends NameState{}
    class NameLoaded extends NameState{}
    class NameError extends NameState{}

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/cubit.png)

    After we created state we need to trigger the states

    keyword to trigger: emit(NameLoading) //sample
    
    As you can see we have method to emit some state when its failed or success 
    First we have to emit(ProjectLoading) so user will know if its loading but the loading UI is not here yet, we will do it later.
    and then getting the usecase value which is from the repository and datasource
    then fold method is for extracting the two function which we will do the emitting state.

### 2. Widgets and Screens

Please watch this for more information about bloc. and note. cubit is the more easy to use than bloc. cubit and bloc are components of our state management(flutter_bloc)
    
    Click The Image To Watch
[![Flutter Bloc Understanding](https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_logo_full.png)](https://www.youtube.com/watch?v=w6XWjpBK4W8&list=PLptHs0ZDJKt_T-oNj_6Q98v-tBnVf-S_o)


![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/wrap.png)

    Before we implement our state and cubit, We have to wrap our widget or screens on BlocProvider

![images](https://raw.githubusercontent.com/karlreginaldo/github_cloud_storage/master/documentation/builder.png)

    We are now using the blocbuilder under the hood we already use the function of of cubit which is the loadingInitialData()

    so we it will emit the ProjectLoading and if its have data it will emit the ProjectLoaded with list of project 

    notes: the way we can trigger a function of cubit we can use this (context.read<ProjectCubit>().loadInitialData();)

















