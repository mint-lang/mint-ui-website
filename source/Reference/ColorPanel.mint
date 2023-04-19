component Reference.ColorPanel {
  state value : Color = Color::HEX("000000FF")
  state embedded : Bool = false
  state size : Number = 16

  get playgroundCode : String {
    let color =
      value
      |> Color.toCSSHex()
      |> String.chopStart("#")

    "Ui.ColorPanel"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addExpression("value", "Color::HEX(\"#{color}\")")
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("embedded", embedded)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.ColorPanel" }>>
        <p>
          "A color panel allows you to pick a color in HSV color sp" \
          "ace, where the hue is a vertical slider, the saturation " \
          "and value is a square input and the alpha is a horizonta" \
          "l slider."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.ColorPanel"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size: value } }}
                  value={size}
                  max={50}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Value">
                <Ui.ColorPicker
                  onChange={(value : Color) { next { value: value } }}
                  value={value}/>
              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Embeeded">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { embedded: value } }}
                  checked={embedded}/>

              </Ui.Field>
            }>
            data={
              {
                <Ui.ColorPanel
                  onChange={(value : Color) { next { value: value } }}
                  size={Ui.Size::Px(size)}
                  embedded={embedded}
                  value={value}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Value"
        content={
          <p>
            "The color can be controlled with the "

            <code>"value"</code>

            " property:"
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            controlled={true}
            data={
              @format {
                <>
                  <Ui.ColorPanel value={Color::HEX("FF0000FF")}/>
                  <Ui.ColorPanel value={Color::HEX("00FF00FF")}/>
                  <Ui.ColorPanel value={Color::HEX("0000FFFF")}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Size"
        content={
          <p>
            "The size of the component can be set with the "

            <code>"size"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            controlled={true}
            data={
              @format {
                <>
                  <Ui.ColorPanel size={Ui.Size::Px(8)}/>
                  <Ui.ColorPanel size={Ui.Size::Px(12)}/>
                  <Ui.ColorPanel size={Ui.Size::Px(16)}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Embedded"
        content=<{
          <p>
            "The control can be embedded by setting "

            <code>"embedded"</code>

            " property to "
            <code>"true"</code>
          </p>

          <p>
            "This will remove the border and make the padding smaller" \
            ". It's mainly used to embed the panel into a picker."
          </p>
        }>
        example={
          <Example
            horizontalSpacing={20}
            controlled={true}
            data={
              @format {
                <>
                  <Ui.ColorPanel embedded={false}/>
                  <Ui.ColorPanel embedded={true}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Change Event"
        content={
          <p>
            "The panel emits a change event when the user manipulates the panel using the "

            <code>"onChange"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            controlled={true}
            data={
              @format {
                <Ui.ColorPanel
                  onChange={
                    Function.debounce1(
                      (color : Color) {
                        let colorString =
                          Color.toCSSHex(color)

                        let content =
                          <{ "Color changed to: #{colorString}" }>

                        Ui.Notifications.notifyDefault(content)
                      }, 200)
                  }/>
              }
            }/>
        }/>

      <DocBox
        title="End Event"
        content={
          <p>
            "The panel emits an end event when the use stops manipulating the panel using "

            <code>"onEnd"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            controlled={true}
            data={
              @format {
                <Ui.ColorPanel
                  onEnd={
                    () {
                      Ui.Notifications.notifyDefault(<{ "Manipulation ended!" }>)
                    }
                  }/>
              }
            }/>
        }/>
    </>
  }
}
