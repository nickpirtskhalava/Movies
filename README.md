# Movies

### Description
*Movies* is an iOS application built with __MVP (Model View Presenter)__ and __Clean Architecture__ concepts.
Each scene presentation logics is divided into 4 separate layers.

*MVP concepts*: 

* __View__ - __ViewController__ is presented as a dummy view. No business logics go inside it.
* __Presenter__ contains the presentation logic and tells the View what to present.
* __Configurator__ injects the dependency object graph into the scene (view controller).
* __Router__ contains navigation / flow logic from one scene (view controller) to another.

*Clean Architecture__ concepts*: 

* __Use Case__ contains the application / business logic for a specific use case in application.
* __Gateway__  contains actual implementation of the protocols defined in the Application Logic layer.

### Application Details

Application starts with fetching __popular__ movies using imdb public api. in case of success data fetch, it shows movies with the help of UICollectionView (Grid). when data fails user is informed about the error. There is a filter button on the right side of the navigation bar. tapping a filter bar item user is redirected to the filter scene where you can choose one from __popular__, __top rated__ and __favorite__ categories. if user has no movies in favorites he looks at the empty screen till he adds one from the movide details page which contains movie *poster*, *title*, *original title*, *overview*, *rating*, *release Date* and *favorite button*. favorite button adds browsing movie details to the CoreData. if the movie is already in database you are not allowed to add it any more and are informed about the movie. After user adds movie to local storage he can find it in favorites category. 

### Run Requirements

* Xcode 10.2.1
* Swift 5

### Target iOS Version

* iOS 10

### 3rd Party Libraries

* SDWebImage
