module Auth exposing (User, auth)

import Json.Encode as E
import Json.Decode exposing (Decoder, field, string)
import Http

import Msg exposing (Msg(..))

type alias User =
  { email : String
  , password : String }

encode : User -> E.Value
encode user =
  E.object
    [ ("email", E.string user.email)
    , ("password", E.string user.password)
    ]

auth : User -> Cmd Msg
auth user =
  Http.request
    { method = "POST"
    , headers = []
    , url = "http://localhost:8000/v1/auth/login"
    , body = Http.jsonBody (encode user)
    , expect = Http.expectJson AuthMsg tokenDecoder
    , timeout = Nothing
    , tracker = Nothing
    }

tokenDecoder : Decoder String
tokenDecoder =
  field "token" string
