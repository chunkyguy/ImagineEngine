//
//  AsteroidBlaster.swift
//  AsteroidBlaster
//
//  Created by Sidharth Juyal on 20/02/2023.
//

import ImagineEngine
import QuartzCore

class AsteroidBlasterScene: Scene {
    let housesGroup = Group.name("Houses")
    let groundGroup = Group.name("Ground")
    
    override func setup() {
        backgroundColor = Color(red: 0, green: 0, blue: 0.3, alpha: 1)

        let groundSize = Size(width: size.width, height: 100)
        let ground = Block(size: groundSize, textureCollectionName: "Ground")
        ground.position.x = center.x
        ground.position.y = size.height - groundSize.height / 2
        ground.group = groundGroup
        add(ground)

        for x in stride(from: center.x - 100, to: center.x + 150, by: 50) {
            let house = Actor()
            house.animation = Animation(name: "House", frameCount: 1, frameDuration: 0)
            house.group = housesGroup
            add(house)

            house.position.x = x
            house.position.y = ground.rect.minY - house.size.height / 2
        }

        timeline.repeat(withInterval: 2) { [weak self] in
            guard let this = self else { return }
            this.update(scene: this)
        }
    }
    
    private func update(scene: Scene) {
        let scene = self

        let asteroid = Actor()
        asteroid.animation = Animation(name: "Asteroid", frameCount: 1, frameDuration: 0)
        scene.add(asteroid)

        let positionRange = scene.size.width - asteroid.size.width
        let randomPosition = CGFloat.random(in: 0..<positionRange)
        asteroid.position.x = asteroid.size.width / 2 + randomPosition

        asteroid.velocity.dy = 100

        asteroid.events.collided(withBlockInGroup: groundGroup).observe { asteroid in
            asteroid.explode()
        }

        asteroid.events.collided(withActorInGroup: housesGroup).observe { asteroid, house in
            asteroid.explode()

            house.explode().then {
                for actor in scene.actors {
                    if actor.group == self.housesGroup {
                        return
                    }
                }

                scene.reset()
            }
        }

        asteroid.events.clicked.observe { asteroid in
            asteroid.explode()
        }
    }
}

extension Actor {
    @discardableResult func explode() -> ActionToken {
        velocity = .zero

        let explosionAnimation = Animation(
            name: "Explosion",
            frameCount: 7,
            frameDuration: 0.07,
            repeatMode: .never
        )

        return playAnimation(explosionAnimation).then {
            self.remove()
        }
    }
}
