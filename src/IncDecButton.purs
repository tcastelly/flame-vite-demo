module IncDecButton (button, Message(..), withMessage, withLabel, newArgs, Args) where

import Flame (Html)
import Flame.Html.Attribute (class')
import Flame.Html.Attribute as HA
import Flame.Html.Element as HE

-- | This datatype is used to signal events to `update`
data Message =
  Increment
  | Decrement
  | Nothing

type Args = {
  message ∷ Message
  , label ∷ String
  }

newArgs ∷ Args
newArgs = {
  message: Nothing
  , label: ""
  }

withMessage ∷ Message → Args → Args
withMessage message args = args {
    message = message
  }

type Label = String
withLabel ∷ Label → Args → Args
withLabel label args = args {
    label = label
  }

cls ∷ String
cls = "inline-flex items-center rounded border border-transparent bg-indigo-600 px-2.5 py-1.5 text-xs font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"

button ∷ Args → Html Message
button { message, label } = HE.button [ HA.onClick message, class' cls ] label
