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

    @layout = MainLayout.new
    @mainWindow.contentView = @layout.view

    @label = @layout.get(:label)
    @button = @layout.get(:button)
    @button.target = self
    @button.action = 'button_pressed:'
  end

  def button_pressed(sender)
    @taps ||= 0
    @taps += 1

    @label.stringValue = "#{@taps} presses"
  end
end