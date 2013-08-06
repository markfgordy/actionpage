class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
  	@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @create_user_controller = CreateUserController.alloc.initWithNibName(nil, bundle:nil)
    @window.rootViewController =
    UINavigationController.alloc.initWithRootViewController(@create_user_controller)
    #nav_controller = UINavigationController.alloc.initWithRootViewController(add_kid_controller)

  	@window.makeKeyAndVisible
    true
  end
end