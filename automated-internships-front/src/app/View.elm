module View exposing (authForm)

import Html exposing (Html, Attribute, div, input, button, text)
import Html.Attributes exposing (placeholder, class, value)
import Html.Events exposing (onClick, onInput)
import Bootstrap.Form.Input as Input
import Bootstrap.Form.Fieldset as Fieldset
import Bootstrap.Form.Radio as Radio
import Bootstrap.Button as Button

import Update exposing (..)
import Model exposing (..)
import Msg exposing (Msg(..))

authForm : Model -> Html Msg
authForm model =
  div
    [ class "auth-form"]
    [ Fieldset.config
      |> Fieldset.asGroup
      |> Fieldset.legend [] [ text "Авторизация" ]
      |> Fieldset.attrs [ class "auth-fieldset"]
      |> Fieldset.children
          [ Input.email [ Input.placeholder "Email address", Input.value model.email, Input.onInput UpdateEmail, Input.attrs [ class "auth-email" ] ]
          , Input.password [ Input.placeholder "Password", Input.value model.password, Input.onInput UpdatePassword, Input.attrs [ class "auth-password" ] ]
          , Button.button [ Button.primary, Button.onClick LoginUser, Button.attrs [ class "auth-btn" ] ] [ text "Войти" ]
          ]
      |> Fieldset.view
      , div [] [text model.content]
    ]
