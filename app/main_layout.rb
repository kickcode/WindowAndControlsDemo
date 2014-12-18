class MainLayout < MotionKit::Layout
  SIZE = [150, 30]

  def layout
    add NSTextField, :num1 do
      deferred do
        constraints do
          right.equals(:separator, :left).minus(10)
          top.equals(:separator, :top).minus(5)
          size [50, 30]
        end
      end
    end
    add NSTextField, :separator do
      stringValue "+"
      bezeled false
      drawsBackground false
      editable false
      selectable false
      size_to_fit
      autoresizing_mask :pin_to_center
      frame from_center
    end
    add NSTextField, :num2 do
      deferred do
        constraints do
          left.equals(:separator, :right).plus(10)
          top.equals(:separator, :top).minus(5)
          size [50, 30]
        end
      end
    end

    add NSButton, :calculate do
      deferred do
        title "Calculate"
        size_to_fit
        constraints do
          top.equals(:separator, :bottom).plus(10)
          left.equals(:separator, :left).minus(25)
        end
      end
    end

    add NSTextField, :result do
      bezeled false
      drawsBackground false
      editable false
      selectable false
      size_to_fit
      deferred do
        constraints do
          top.equals(:calculate, :bottom).plus(10)
          left.equals(:separator, :left)
        end
      end
    end
  end
end