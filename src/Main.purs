-- | Counter example using side effects free updating
module Main where

import Prelude

import Effect (Effect)
import Flame (QuerySelector(..), Html)
import Flame.Application.NoEffects as FAN
import Flame.Html.Attribute (class')
import Flame.Html.Attribute as HA
import Flame.Html.Element as HE

-- | The model represents the state of the app
type Model = Int

-- | This datatype is used to signal events to `update`
data Message = Increment
  | Decrement

-- | Initial state of the app
init ∷ Model
init = 0

-- | `update` is called to handle events
update ∷ Model → Message → Model
update model Increment = model + 1
update model Decrement = model - 1

-- | `view` updates the app markup whenever the model is updated
view ∷ Model → Html Message
view model = HE.main "main"
      [ HE.button [ HA.onClick Decrement ] "-"
      , HE.span [ class' "bg-blue-500" ] $ show model
      , HE.button [ HA.onClick Increment ] "+"
      ]

-- | Mount the application on the given selector
main ∷ Effect Unit
main = FAN.mount_ (QuerySelector "body")
      { init
      , subscribe: []
      , update
      , view
      }
