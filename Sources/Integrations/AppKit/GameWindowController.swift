/**
 *  Imagine Engine
 *  Copyright (c) John Sundell 2017
 *  Copyright (c) Guilherme Rambo 2017
 *  See LICENSE file for license
 */

import AppKit

/// Window controller that can be used to present & manage an Imagine Engine game
public class GameWindowController: NSWindowController {
    /// The game that the window controller is managing
    public var game: Game { return viewController.game }
    private let viewController: GameViewController

    /// Initialize an instance of this window controller, optionally with a scene to present
    private init(size: Size, scene: Scene) {
        viewController = GameViewController(size: size, scene: scene)

        let window = NSWindow(
            contentRect: NSRect(origin: .zero, size: size),
            styleMask: [.closable, .miniaturizable, .titled],
            backing: .buffered,
            defer: false
        )

        super.init(window: window)

        contentViewController = viewController
        window.center()
    }
    
    public convenience init(scene: Scene) {
        self.init(size: scene.size, scene: scene)
    }
    
    public convenience init(size: Size) {
        self.init(scene: Scene(size: size))
    }
    
    required public convenience init?(coder: NSCoder) {
        self.init(size: .zero)
    }
}
