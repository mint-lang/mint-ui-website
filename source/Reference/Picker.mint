component Reference.Picker {
  connect ListItems exposing { ICON_ITEMS, POSITIONS, getIcon }
  connect Ui exposing { mobile }

  state placeholder : String = "Pick something!"
  state position : String = "BottomLeft"
  state icon : String = "CHEVRON_DOWN"
  state label : String = ""

  state offset : Number = 10
  state size : Number = 16

  state matchWidth : Bool = false
  state disabled : Bool = false
  state invalid : Bool = false

  const PANEL =
    @format {
      <{ "Panel" }>
    }

  get playgroundCode : String {
    try {
      maybeLabel =
        if (String.isBlank(label)) {
          "Maybe::Nothing"
        } else {
          "Maybe::Just(<{ \"#{label}\" }>)"
        }

      "Ui.Picker"
      |> ComponentBuilder.new()
      |> ComponentBuilder.addString("placeholder", placeholder)
      |> ComponentBuilder.addExpression("position", "Ui.Position::#{position}")
      |> ComponentBuilder.addIcon("icon", icon)
      |> ComponentBuilder.addExpression("label", maybeLabel)
      |> ComponentBuilder.addSizePx("size", size)
      |> ComponentBuilder.addRaw("panel", PANEL[1])
      |> ComponentBuilder.addBool("matchWidth", matchWidth)
      |> ComponentBuilder.addBool("disabled", disabled)
      |> ComponentBuilder.addBool("invalid", invalid)
      |> ComponentBuilder.addNumber("offset", offset)
      |> ComponentBuilder.toString()
    }
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Picker" }>>
        <p>
          "A component for implementing custom pickers (date, select, color, etc...)."
          <br/>
          "It consists of an element which when click opens a dropdown (in mobile resolutions a modal)."
        </p>

        <p>"It handles the following interactions:"</p>

        <ul>
          <li>"Clicking on the element opens the dropdown."</li>
          <li>"Clicking outside of the element or dropdown hides the dropdown."</li>
          <li>"Clicking in the dropdown does not hide the dropdown."</li>
          <li>"Keyboard focusing the element does not open the dropdown."</li>

          <li>
            <kbd>"Enter"</kbd>
            " hides the dropdown if the handler returns true."
          </li>

          <li>
            <kbd>"Space"</kbd>
            " shows the dropdown."
          </li>

          <li>
            <kbd>"Esc"</kbd>
            " hides the dropdown."
          </li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Picker"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Placeholder">
                <Ui.Input
                  onChange={(value : String) { next { placeholder = value } }}
                  value={placeholder}/>
              </Ui.Field>

              <Ui.Field label="Label">
                <Ui.Input
                  onChange={(value : String) { next { label = value } }}
                  value={label}/>
              </Ui.Field>

              <Ui.Field label="Icon">
                <Ui.Native.Select
                  onChange={(value : String) { next { icon = value } }}
                  items={ICON_ITEMS}
                  value={icon}/>
              </Ui.Field>

              <Ui.Field label="Position">
                <Ui.Native.Select
                  onChange={(value : String) { next { position = value } }}
                  items={POSITIONS}
                  value={position}/>
              </Ui.Field>

              <Ui.Field label="Offset (#{offset}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { offset = value } }}
                  value={offset}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size = value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Match Width">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { matchWidth = value } }}
                  checked={matchWidth}/>

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
                <Ui.Picker
                  position={Ui.Position.fromString(position)}
                  placeholder={placeholder}
                  size={Ui.Size::Px(size)}
                  matchWidth={matchWidth}
                  icon={getIcon(icon)}
                  disabled={disabled}
                  invalid={invalid}
                  panel={PANEL[0]}
                  offset={offset}
                  label={
                    if (String.isBlank(label)) {
                      Maybe::Nothing
                    } else {
                      Maybe::Just(label)
                    }
                  }/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Panel"
        content={
          <p>
            "The content inside the panel can be set using the "

            <code>"panel"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[3, 7]
            data={
              @format {
                <>
                  <Ui.Picker
                    placeholder="Pick something!"
                    panel=<{ "Panel..." }>/>

                  <Ui.Picker
                    placeholder="Pick something!"
                    panel={<Ui.Button label="Click me!"/>}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Label"
        content={
          <p>
            "The label "

            <code>"label"</code>

            " property is shown in the element if given. It is used t" \
            "o indicate that a value has been picked."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[2, 8]
            data={
              @format {
                <>
                  <Ui.Picker
                    label={Maybe::Just(<{ "Label..." }>)}
                    placeholder="Pick something!"
                    panel=<{ "Panel..." }>/>

                  <Ui.Picker
                    placeholder="Pick something!"
                    label={Maybe::Nothing}
                    panel=<{ "Panel..." }>/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Placeholder"
        content={
          <p>
            "The placeholder can be changed with the "

            <code>"placeholder"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[1]
            data={
              @format {
                <Ui.Picker
                  placeholder="Pick something!"
                  panel=<{ "Panel..." }>/>
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
            highlight=[3, 8, 13]
            data={
              @format {
                <>
                  <Ui.Picker
                    placeholder="Pick something!"
                    size={Ui.Size::Px(12)}
                    panel=<{ "Panel..." }>/>

                  <Ui.Picker
                    placeholder="Pick something!"
                    size={Ui.Size::Px(16)}
                    panel=<{ "Panel..." }>/>

                  <Ui.Picker
                    placeholder="Pick something!"
                    size={Ui.Size::Px(20)}
                    panel=<{ "Panel..." }>/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Icon"
        content=<{
          <p>
            "An icon can be displayed in the right side of the elemen" \
            "t, which is usually used to indicate that the picker a d" \
            "ropdown."
          </p>
        }>
        example={
          <Example
            horizontalSpacing={20}
            highlight=[3, 8]
            data={
              @format {
                <>
                  <Ui.Picker
                    placeholder="Pick something!"
                    icon={Ui.Icons:CHEVRON_DOWN}
                    panel=<{ "Panel..." }>/>

                  <Ui.Picker
                    placeholder="Pick something!"
                    icon={Ui.Icons:BEAKER}
                    panel=<{ "Panel..." }>/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Position"
        content={
          <p>
            "The position of the panel can be controlled with the "

            <code>"position"</code>

            " property."
          </p>
        }
        example={
          if (mobile) {
            <Ui.ContentHint icon={Ui.Icons:INFO}>
              "The example only is available on desktop resolution!"
            </Ui.ContentHint>
          } else {
            <Example
              highlight=[2, 7, 12, 17, 22, 27]
              verticalSpacing={20}
              fullWidth={true}
              data={
                @format {
                  <Ui.Grid>
                    <Ui.Picker
                      position={Ui.Position::TopLeft}
                      placeholder="Top Left"
                      panel=<{ "Panel..." }>/>

                    <Ui.Picker
                      position={Ui.Position::TopCenter}
                      placeholder="Top Center"
                      panel=<{ "Panel..." }>/>

                    <Ui.Picker
                      position={Ui.Position::TopRight}
                      placeholder="Top Right"
                      panel=<{ "Panel..." }>/>

                    <Ui.Picker
                      position={Ui.Position::BottomLeft}
                      placeholder="Bottom Left"
                      panel=<{ "Panel..." }>/>

                    <Ui.Picker
                      position={Ui.Position::BottomCenter}
                      placeholder="Bottom Center"
                      panel=<{ "Panel..." }>/>

                    <Ui.Picker
                      position={Ui.Position::BottomRight}
                      placeholder="Bottom Right"
                      panel=<{ "Panel..." }>/>
                  </Ui.Grid>
                }
              }/>
          }
        }/>

      <DocBox
        title="Offset"
        content={
          <p>
            "The offset of the panel can be controlled with the "

            <code>"offset"</code>

            " property."
          </p>
        }
        example={
          if (mobile) {
            <Ui.ContentHint icon={Ui.Icons:INFO}>
              "The example only is available on desktop resolution!"
            </Ui.ContentHint>
          } else {
            <Example
              horizontalSpacing={20}
              highlight=[4, 9, 14]
              data={
                @format {
                  <>
                    <Ui.Picker
                      placeholder="Pick Something!"
                      panel=<{ "Panel..." }>
                      offset={5}/>

                    <Ui.Picker
                      placeholder="Pick Something!"
                      panel=<{ "Panel..." }>
                      offset={10}/>

                    <Ui.Picker
                      placeholder="Pick Something!"
                      panel=<{ "Panel..." }>
                      offset={20}/>
                  </>
                }
              }/>
          }
        }/>

      <DocBox
        title="Match Width"
        content={
          <p>
            "Whether or not the panel should match the width the element can be controlled with the "

            <code>"matchWidth"</code>

            " property."
          </p>
        }
        example={
          if (mobile) {
            <Ui.ContentHint icon={Ui.Icons:INFO}>
              "The example only is available on desktop resolution!"
            </Ui.ContentHint>
          } else {
            <Example
              horizontalSpacing={20}
              highlight=[4, 9]
              data={
                @format {
                  <>
                    <Ui.Picker
                      placeholder="Pick something!"
                      panel=<{ "Panel..." }>
                      matchWidth={false}/>

                    <Ui.Picker
                      placeholder="Pick something!"
                      panel=<{ "Panel..." }>
                      matchWidth={true}/>
                  </>
                }
              }/>
          }
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
            highlight=[3]
            data={
              @format {
                <Ui.Picker
                  placeholder="Pick something!"
                  panel=<{ "Panel..." }>
                  disabled={true}/>
              }
            }/>
        }/>

      <DocBox
        title="Invalid"
        content={
          <p>
            "The component can be marked invalid using the "

            <code>"invalid"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[3]
            data={
              @format {
                <Ui.Picker
                  placeholder="Pick something!"
                  panel=<{ "Panel..." }>
                  invalid={true}/>
              }
            }/>
        }/>
    </>
  }
}
