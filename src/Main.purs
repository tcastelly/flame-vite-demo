-- | Counter example using side effects free updating
module Main where

import Prelude

import IncDecButton (Message(..))
import IncDecButton as Button
import Effect (Effect)
import Flame (QuerySelector(..), Html)
import Flame.Application.NoEffects as FAN
import Flame.Html.Attribute (class')
import Flame.Html.Attribute as HA
import Flame.Html.Element as HE

-- | The model represents the state of the app
type Model = Int

-- | Initial state of the app
init ∷ Model
init = 0

-- | `update` is called to handle events
update ∷ Model → Message → Model
update model Increment = model + 1
update model Decrement = model - 1
update model Nothing = model

button ∷ Button.Args → Html Message
button { message, label } = HE.button [HA.onClick message ] label

incrementButton ∷ Html Message
incrementButton = Button.newArgs
  # Button.withLabel "+"
  # Button.withMessage Increment
  # Button.button

decrementButton ∷ Html Message
decrementButton = Button.newArgs
  # Button.withLabel "-"
  # Button.withMessage Decrement
  # Button.button

-- | `view` updates the app markup whenever the model is updated
view ∷ Model → Html Message
view model = HE.main "main"
      [ decrementButton
      , viewSpan model "text-center inline-block w-[40px]"
      , incrementButton
      ]

viewSpan ∷ Int → String → Html Message
viewSpan txt cls  = HE.span [class' cls] $ show txt

-- | Mount the application on the given selector
main ∷ Effect Unit
main = FAN.mount_ (QuerySelector "body")
      { init
      , subscribe: []
      , update
      , view
      }
