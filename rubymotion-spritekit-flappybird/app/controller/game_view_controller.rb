class GameViewController < UIViewController
  def viewDidLoad
    super

    scene = GameScene.sceneWithSize(view.frame.size)

    self.view = sk_view
    sk_view.presentScene scene
  end

  def sk_view
    @sk_view ||= begin
      sk_view = SKView.alloc.initWithFrame(view.frame)
      sk_view.showsFPS = true
      sk_view.showsNodeCount = true

      sk_view
    end
  end

  def prefersStatusBarHidden
    true

  end

end
