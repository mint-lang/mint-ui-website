component Reference.ColorPicker {
  connect ListItems exposing { POSITIONS }

  state value : Color = Color::HEX("000000FF")
  state position : String = "BottomRight"
  state disabled : Bool = false
  state invalid : Bool = false
  state offset : Number = 5
  state size : Number = 16

  get playgroundCode : String {
    "Ui.ColorPicker"
    |> ComponentBuilder.new
    |> ComponentBuilder.addExpression("position", "Ui.Position::#{position}")
    |> ComponentBuilder.addExpression("value", "Color::HEX(\"#{color}\")")
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addBool("invalid", invalid)
    |> ComponentBuilder.addNumber("offset", offset)
    |> ComponentBuilder.toString()
  } where {
    color =
      value
      |> Color.toCSSHex()
      |> String.lchop("#")
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.ColorPicker" }>>
        <p>"A component that allows the user to pick a color from a color panel in a dropdown."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.ColorPicker"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Value">
                <Ui.ColorPicker
                  onChange={(value : Color) { next { value = value } }}
                  value={value}/>
              </Ui.Field>

              <Ui.Field label="Position">
                <Ui.Native.Select
                  onChange={(position : String) { next { position = position } }}
                  items={POSITIONS}
                  value={position}/>
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size = value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Offset (#{offset}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { offset = value } }}
                  value={offset}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Disabled">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { disabled = value } }}
                  checked={disabled}/>

              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Invalid">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { invalid = value } }}
                  checked={invalid}/>

              </Ui.Field>
            }>
            data={
              {
                <Ui.ColorPicker
                  onChange={(value : Color) { next { value = value } }}
                  position={Ui.Position.fromString(position)}
                  size={Ui.Size::Px(size)}
                  disabled={disabled}
                  invalid={invalid}
                  offset={offset}
                  value={value}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Value"
        content={
          <p>
            "The value can be controlled with the "

            <code>"value"</code>

            " property."
          </p>
        }
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.ColorPicker value={Color::HEX("FF0000FF")}/>
              }
            }/>
        }/>

      <DocBox
        title="Disabled"
        content={
          <p>
            "The component can be disabled using the "

            <code>"disabled"</code>

            " property."
          </p>
        }
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.ColorPicker disabled={true}/>
              }
            }/>
        }/>

      <DocBox
        title="Invalid"
        content={
          <p>
            "The component can be makred invalid using the "

            <code>"invalid"</code>

            " property."
          </p>
        }
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.ColorPicker invalid={true}/>
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
                  <Ui.ColorPicker size={Ui.Size::Px(12)}/>
                  <Ui.ColorPicker size={Ui.Size::Px(16)}/>
                  <Ui.ColorPicker size={Ui.Size::Px(20)}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Position"
        content={
          <p>
            "The position property controls the panels position. "
            "For more information check out the the "

            <a href="/components/ui-dropdown#position">
              "same property"
            </a>

            " of the "
            <code>"Ui.Dropdown"</code>
          </p>
        }/>

      <DocBox
        title="Offset"
        content={
          <p>
            "The offset property controls the panels offset. "
            "For more information check out the the "

            <a href="/components/ui-dropdown#offset">
              "same property"
            </a>

            " of the "
            <code>"Ui.Dropdown"</code>
          </p>
        }/>
    </>
  }
}
