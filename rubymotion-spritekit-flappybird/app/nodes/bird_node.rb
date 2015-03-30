class BirdNode < SKSpriteNode
  def init
    if initWithTexture(texture_for("bird_1"))
      configure_node
    end

    self
  end

  def configure_node
    animation = SKAction.animateWithTextures([texture_for("bird_1"), texture_for("bird_2"), texture_for("bird_3")], timePerFrame: 0.2)
    runAction SKAction.repeatActionForever(animation)
  end

  def texture_for(image_name)
    texture = SKTexture.textureWithImageNamed(image_name)
    texture.filteringMode = SKTextureFilteringNearest

    texture
  end
end
