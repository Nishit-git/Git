//
//  TestView.swift
//  Git
//
//  Created by Nishit on 2017-10-08.
//  Copyright © 2017 Nishit. All rights reserved.
//

import Foundation
import SpriteKit

class TestView: SKScene
{
    
    var MainGuy = SKSpriteNode()
    
    var textureAtlas = SKTextureAtlas()
    var textureArray = [SKTexture]()
    override func didMove(to view: SKView) {
        
        textureAtlas = SKTextureAtlas(named: "WinImages")
        NSLog("\(textureAtlas.textureNames)")
        
        for i in 1...textureAtlas.textureNames.count
        {
            let Name = "win_\(i).png"
            textureArray.append(SKTexture(imageNamed: Name))
            
        }
        MainGuy = SKSpriteNode(imageNamed: textureAtlas.textureNames[0] )
        
        MainGuy.size = CGSize(width: 70, height: 140)
        MainGuy.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(MainGuy)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        MainGuy.run(SKAction.repeatForever(SKAction.animate(with: textureArray, timePerFrame: 0.1)))
    }
    
}
