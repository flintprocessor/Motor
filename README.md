<div align="center"><img src="/Assets/logo.svg" width="450" /></div>
<h1 align="center">
  <b>Motor</b>
  <br>
  <a href="https://github.com/flintbox/Motor/releases"><img src="https://img.shields.io/github/release/flintbox/Motor.svg" alt="GitHub release" /></a>
  <a href="https://swift.org/package-manager"><img src="https://img.shields.io/badge/Swift%20PM-compatible-orange.svg" alt="Swift Package Manager" /></a>
  <a href="https://github.com/flintbox/Motor/blob/master/LICENSE"><img src="https://img.shields.io/github/license/mashape/apistatus.svg" alt="license" /></a>
</h1>

*Swift cli spinner. **Simple** and **fully customizable**.*

**Table of Contents**
- [Demo](#demo)
- [Installation](#installation)
- [Customization](#customization)
  - [Pattern](#pattern)
  - [Delay](#delay)
  - [Message](#message)
- [Contribute](#contribute)

## [Demo](https://github.com/flintbox/Motor/blob/master/Sources/motor-example/main.swift)

```swift
import Foundation
import Motor

/// Initialize spinner.
let spinner = Spinner(pattern: Patterns.dots)
/// Start spinner.
spinner.start(message: "Motor initiated...")
/// Do your job.
sleep(2)
/// Print message.
spinner.display("Do something...")
/// Do another job.
sleep(3)
/// Stop spinner with message.
spinner.stop(message: "✓".color(.green) + " Done!")
```

### On terminal

![Demo](Assets/demo.gif)

## Installation

Add Motor to `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/flintbox/Motor", from: "0.1.1")
]
```

## Customization

### [Pattern](https://github.com/flintbox/Motor/blob/master/Sources/Motor/Pattern.swift)

```swift
public struct Pattern {

    public let frames: [String]
    public let fps: UInt32
}
```

Spinner pattern. `frames` for frames of the animation. `fps`(frames per second) for frame rate.

### [Delay](https://github.com/flintbox/Motor/blob/master/Sources/Motor/Animator.swift)

```swift
open class Animator: Operation {

    public init(pattern: Pattern, delay: UInt32) {
        spinner = Animation(pattern: pattern)
        self.delay = delay
        super.init()
    }
}
```

Delay before starting animation. Useful when duration of the job could be short and don't want to flash spinner.

### [Message](https://github.com/flintbox/Motor/blob/master/Sources/Motor/Spinner.swift)

```swift
open class Spinner {

    open func start(message: String = "") {
    }

    open func display(_ message: String) {
    }

    open func stop(message: String? = nil) {
    }
}
```

On start, during or termination of the animation. Show message beside spinner. **Please, keep in mind that the spinner and message should be in one line to be correctly animated.**

## Contribute

If you have good idea or suggestion? Please, don't hesitate to open a pull request or send me an [email](mailto:contact@jasonnam.com).

Hope you enjoy building command line tool with Motor!
