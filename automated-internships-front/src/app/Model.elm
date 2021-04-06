module Model exposing (Model, Route(..))

type alias Model =
  { content : String
  , email : String
  , password : String
  , route : Maybe Route
  }

type Route =
  Login
