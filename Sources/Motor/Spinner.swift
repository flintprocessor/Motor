//
//  Spinner.swift
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

/// Spinner.
open class Spinner {

    /// Spinner animator.
    open private(set) var animator: Animator?
    /// Operation queue to run animation.
    public let queue = OperationQueue()

    /// Spinner pattern.
    public let pattern: Pattern
    /// Delay before starting animation.
    public let delay: UInt32

    /// Initialize spinner.
    ///
    /// - Parameters:
    ///   - pattern: Spinner pattern.
    ///   - delay: Delay before starting animation.
    public init(pattern: Pattern, delay: UInt32 = 0) {
        self.pattern = pattern
        self.delay = delay
        queue.maxConcurrentOperationCount = 1
    }

    /// Start animation.
    ///
    /// - Parameter message: Message to display
    ///                      beside spinner.
    open func start(message: String = "") {
        queue.cancelAllOperations()
        animator = Animator(pattern: pattern, delay: delay)
        animator!.qualityOfService = .utility
        animator!.text = message
        queue.addOperation(animator!)
    }

    /// Display message.
    ///
    /// - Parameter message: Message to display
    ///                      beside spinner.
    open func display(_ message: String) {
        animator?.text = message
    }

    /// Stop and erase spinner
    /// and show message if needed.
    ///
    /// - Parameter message: Message to display
    ///                      beside spinner.
    open func stop(message: String? = nil) {
        animator?.cancel()
        animator = nil
        moveCursorToColumn(1)
        eraseInLine(.entireLine)
        if let message = message, !message.isEmpty {
            print(message)
        }
    }
}
