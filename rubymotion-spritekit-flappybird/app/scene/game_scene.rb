class GameScene < SKScene
  def didMoveToView(view)
    self.backgroundColor = UIColor.colorWithRed(81.0/255.0, green: 192.0/255.0, blue: 201.0/255.0, alpha: 1.0)

    init_scene
  end

  def init_scene
    setup_ground
    setup_skyline

    bird.position = [size.width * 0.2, size.height * 0.6]

    addChild bird
  end

  def setup_ground
    move_ground_sprite = SKAction.moveByX(-ground_texture.size.width, y: 0, duration: 0.002 * ground_texture.size.width)
    reset_ground_sprite = SKAction.moveByX(ground_texture.size.width, y: 0, duration: 0.0)
    move_ground_sprites_forever = SKAction.repeatActionForever(SKAction.sequence([move_ground_sprite, reset_ground_sprite]))

    limit = 2.0 + size.width / ground_texture.size.width
    for i in 0..limit.ceil
      sprite = SKSpriteNode.alloc.initWithTexture ground_texture
      sprite.position = [i * sprite.size.width, sprite.size.height / 2.0]
      sprite.runAction move_ground_sprites_forever
      addChild sprite
    end

    ground = SKNode.new
    ground.position = [0, ground_texture.size.height / 2]

    addChild ground
  end

  def setup_skyline
    move_sky_sprite = SKAction.moveByX(-sky_texture.size.width, y: 0, duration: 0.01 * sky_texture.size.width)
    reset_sky_sprite = SKAction.moveByX(sky_texture.size.width, y: 0, duration: 0.0)
    move_sky_sprites_forever = SKAction.repeatActionForever(SKAction.sequence([move_sky_sprite, reset_sky_sprite]))

    limit = 2.0 + size.width / sky_texture.size.width
    for i in 0..limit.ceil
      sprite = SKSpriteNode.alloc.initWithTexture sky_texture
      sprite.zPosition = -1
      sprite.position = [i * sprite.size.width, sprite.size.height / 2.0 + ground_texture.size.height]
      sprite.runAction move_sky_sprites_forever

      addChild sprite
    end
  end

  def bird
    @bird ||= BirdNode.new
  end

  def texture_for(image_name)
    @textures = {} unless @textures

    @textures[image_name] = begin
      texture = SKTexture.textureWithImageNamed image_name
      texture.filteringMode = SKTextureFilteringNearest
      texture
    end
  end

  def ground_texture
    texture_for "land"
  end

  def sky_texture
    texture_for "sky"
  end

  def update(currentTime)
  end

end
