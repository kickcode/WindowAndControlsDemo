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

    @num1 = @layout.get(:num1)
    @num2 = @layout.get(:num2)
    @calculate = @layout.get(:calculate)
    @calculate.target = self
    @calculate.action = 'calculate_result:'
    @result = @layout.get(:result)
  end

  def calculate_result(sender)
    @result.stringValue = (@num1.stringValue.to_i + @num2.stringValue.to_i).to_s
  end
end