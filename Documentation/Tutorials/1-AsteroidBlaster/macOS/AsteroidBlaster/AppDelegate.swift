//
//  AppDelegate.swift
//  AsteroidBlaster
//
//  Created by Sidharth Juyal on 20/02/2023.
//

import Cocoa
import ImagineEngine

class AppDelegate: NSObject, NSApplicationDelegate {
    var winCtrl: NSWindowController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let scene = AsteroidBlasterScene(size: Size(width: 375, height: 667))
        winCtrl = GameWindowController(scene: scene)
        winCtrl.window?.makeKeyAndOrderFront(nil)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}
