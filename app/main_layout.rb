class MainLayout < MotionKit::Layout
  SIZE = [150, 30]

  view :button, :label

  def layout
    add NSButton, :button do
      title "a test button"
      size SIZE
      autoresizing_mask :pin_to_center
      frame from_center
    end
    add NSTextField, :label do
      bezeled false
      drawsBackground false
      editable false
      selectable false
      size SIZE
      autoresizing_mask :pin_to_center
      frame from_center(up: 3)
    end
  end
end