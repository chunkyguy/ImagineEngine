/**
 *  Imagine Engine
 *  Copyright (c) John Sundell 2017
 *  See LICENSE file for license
 */

import Foundation

internal protocol Activatable: AnyObject {
    func activate(in game: Game)
    func deactivate()
}

extension Activatable {
    func deactivate() {}
}
