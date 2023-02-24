//
//  ViewController.swift
//  AsteroidBlaster
//
//  Created by Sidharth Juyal on 22/02/2023.
//

import UIKit
import ImagineEngine

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let scene = AsteroidBlasterScene(size: view.bounds.size)
        let vwCtrl = GameViewController(scene: scene)
        vwCtrl.modalPresentationStyle = .fullScreen
        present(vwCtrl, animated: false)
    }
}
