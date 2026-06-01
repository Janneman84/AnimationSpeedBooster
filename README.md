# AnimationSpeedBooster
Make your iOS apps literary faster by speeding up page transitions, keyboard popup etc.

<img width="400" height="711" alt="animationspeedboosteexample" src="https://github.com/user-attachments/assets/dfc3b6ce-aa55-4f44-b331-15b38016adf4" />

Make your productivity app more productive by reducing the amount of time a user has to wait for animations. Speed up all animations in your app with just one simple setting. This does not affect scrolling.

Compatible with both UIKit and SwiftUI, iOS and tvOS.

## Bonus feature
For fun you can also adjust the blinking speed of text fields:

<img width="400" height="140" alt="blinkingspeedexample" src="https://github.com/user-attachments/assets/2d187bfa-db9d-4e0c-b20f-3a75c000bde2" />


## Installation

Install this package through SPM using the Github url `https://github.com/Janneman84/AnimationSpeedBooster`. Make sure the library is linked to the target.

## Usage

Anywhere in your app at any time you can change animation speed and/or typing indicator blinking speed.

```swift
import AnimationSpeedBooster
```
Change animation speed using 🚀:
```swift
AnimationSpeedBooster.🚀 = 2.0
```

Change typing indicator blinking speed using 🚨:
```swift
AnimationSpeedBooster.🚨 = 1.5
```

You can use value 0.0 to disable animations entirely.
