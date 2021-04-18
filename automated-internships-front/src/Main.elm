module Main exposing (main)

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Platform.Sub as Sub
import Url
import Browser.Navigation as Nav

import Msg exposing (..)
import Model exposing (..)
import View exposing (..)
import Update exposing (..)

main =
  Browser.application
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlChange = \url -> UrlChange url
        , onUrlRequest = \req -> UrlRequest req
        }

init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( { content = ""
      , email = ""
      , password = ""
      , route = Just Login }
    , Cmd.none )

view : Model -> Browser.Document Msg
view model =
    let
        loginPage = div [] [ authForm model ]
    in
    Browser.Document "internships" <|
        case model.route of
            Just Login ->
                [ loginPage ]
            _ ->
                [ loginPage ]
