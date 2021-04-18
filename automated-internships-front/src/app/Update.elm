module Update exposing (update)

import Http exposing (Error(..))
import Model exposing (..)
import Auth exposing (User, auth)
import Msg exposing (Msg(..))

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    LoginUser ->
      ( model
      , auth (User model.email model.password) )
    UpdateEmail newEmail ->
            ( { model | email = newEmail }
            , Cmd.none )
    UpdatePassword newPassword ->
            ( { model | password = newPassword }
            , Cmd.none )
    AuthMsg res ->
      case res of
        Err err -> ( { model | content = httpErrorToString err }, Cmd.none )
        Ok token -> ( { model | content = token }, Cmd.none )
    UrlChange url -> ( model, Cmd.none )
    UrlRequest req -> ( model, Cmd.none )

httpErrorToString : Http.Error -> String
httpErrorToString err =
    case err of
        NetworkError ->
            "No connection"

        BadStatus status ->
            "Server/Client error: HTTP " ++ String.fromInt status

        BadUrl url ->
            "Bad URL error: " ++ url

        Timeout ->
            "Networked timed out"

        BadBody error ->
            "Server/Client error: " ++ error
