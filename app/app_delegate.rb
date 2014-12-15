class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow
  end

  def buildWindow
    @mainWindow = NSWindow.alloc.initWithContentRect([[240, 180], [480, 360]],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
    @mainWindow.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    @mainWindow.orderFrontRegardless

    size = @mainWindow.frame.size
    button_size = [150, 30]
    @button = NSButton.alloc.initWithFrame([[(size.width / 2.0) - (button_size[0] / 2.0), (size.height / 2.0) - (button_size[1] / 2.0)], button_size])
    @button.title = "a test button"
    @mainWindow.contentView.addSubview @button
  end
end