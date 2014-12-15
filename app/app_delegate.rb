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
    @mainWindow.delegate = self

    @button = NSButton.alloc.initWithFrame(CGRectZero)
    self.set_button_frame
    @button.title = "a test button"
    @mainWindow.contentView.addSubview @button
  end

  def windowDidResize(notification)
    self.set_button_frame
  end

  def set_button_frame
    size = @mainWindow.frame.size
    button_size = [150, 30]
    @button.frame = [[(size.width / 2.0) - (button_size[0] / 2.0), (size.height / 2.0) - (button_size[1] / 2.0)], button_size]
  end
end