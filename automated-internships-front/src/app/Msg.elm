module Msg exposing (Msg(..))

import Http
import Url
import Browser

type Msg
  = UpdateEmail String
  | UpdatePassword String
  | LoginUser
  | AuthMsg (Result Http.Error String)
  | UrlChange Url.Url
  | UrlRequest Browser.UrlRequest
