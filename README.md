[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FJanneman84%2FAnimationSpeedBooster%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Janneman84/AnimationSpeedBooster)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FJanneman84%2FAnimationSpeedBooster%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Janneman84/AnimationSpeedBooster)
[![](https://shields.io/badge/UIKit-white?logo=swift&?style=social)](https://swiftpackageindex.com/Janneman84/AnimationSpeedBooster)
[![](https://img.shields.io/badge/SwiftUI-524520?logo=swift)](https://swiftpackageindex.com/Janneman84/AnimationSpeedBooster)
[![Swift Package Manager compatible](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)



# AnimationSpeedBooster
Make your iOS apps literary faster by speeding up page transitions, keyboard popup etc.

<img width="400" height="711" alt="animationspeedboosteexample" src="https://github.com/user-attachments/assets/dfc3b6ce-aa55-4f44-b331-15b38016adf4" />

Make your productivity app more productive by reducing the amount of time a user has to wait for animations. Speed up all animations in your app with just one simple setting. This does not affect scrolling.

Compatible with both UIKit and SwiftUI, iOS and tvOS.

## Bonus feature
For fun you can also adjust the blinking speed of text fields:

<img width="400" height="136" alt="blinkingspeedexample2" src="https://github.com/user-attachments/assets/67718bc7-23a5-4054-8e12-12410047498d" />

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

## License
MIT
