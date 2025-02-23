/**
 *  Imagine Engine
 *  Copyright (c) John Sundell 2017
 *  See LICENSE file for license
 */

import Foundation

extension ClickGestureRecognizer {
    func addTarget(_ target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }
}
