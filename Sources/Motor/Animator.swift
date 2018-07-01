//
//  Animator.swift
//  Motor
//
//  Copyright (c) 2018 Jason Nam (https://jasonnam.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import ANSIEscapeCode

/// Spinner animator.
open class Animator: Operation {

    /// Text displayed beside spinner.
    open var text = ""

    /// Spinner animation.
    public let spinner: Animation
    /// Delay before starting animation.
    public let delay: UInt32

    /// Initialize animator.
    ///
    /// - Parameters:
    ///   - pattern: Spinner pattern.
    ///   - delay: Delay before starting animation.
    public init(pattern: Pattern, delay: UInt32) {
        spinner = Animation(pattern: pattern)
        self.delay = delay
        super.init()
    }

    /// Run animation.
    open override func main() {
        super.main()
        sleep(delay)
        while !isCancelled {
            eraseLineAndPrintFrame()
            usleep(1000000 * 1/spinner.pattern.fps)
            spinner.findNextFrame()
        }
    }

    /// Erase current line and print frame.
    open func eraseLineAndPrintFrame() {
        moveCursorToColumn(1)
        eraseInLine(.entireLine)
        let output = text.isEmpty ?
            spinner.frame : spinner.frame + " " + text
        print(output, terminator: "")
        fflush(stdout)
    }
}
