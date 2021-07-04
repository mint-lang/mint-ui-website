component Reference.Input {
  connect ListItems exposing { ICON_ITEMS, getIcon }

  state placeholder : String = "Placeholder..."
  state icon : String = "ROCKET"
  state value : String = ""

  state iconInteractive : Bool = false
  state disabled : Bool = false
  state invalid : Bool = false

  state size : Number = 16

  get playgroundCode : String {
    "Ui.Input"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addString("placeholder", placeholder)
    |> ComponentBuilder.addIcon("icon", icon)
    |> ComponentBuilder.addBool("iconInteractive", iconInteractive)
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addBool("invalid", invalid)
    |> ComponentBuilder.addString("value", value)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Input" }>>
        <p>
          "A basic component for getting the user input is a text f" \
          "ield. Keyboard and mouse can be used for providing or ch" \
          "anging data."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Input"</code>

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

              <Ui.Field label="Value">
                <Ui.Input
                  onChange={(value : String) { next { value = value } }}
                  value={value}/>
              </Ui.Field>

              <Ui.Field label="Icon">
                <Ui.Native.Select
                  onChange={(value : String) { next { icon = value } }}
                  items={ICON_ITEMS}
                  value={icon}/>
              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Icon Interactive">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { iconInteractive = value } }}
                  checked={iconInteractive}/>

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

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size = value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.Input
                  onChange={(value : String) { next { value = value } }}
                  iconInteractive={iconInteractive}
                  placeholder={placeholder}
                  size={Ui.Size::Px(size)}
                  icon={getIcon(icon)}
                  disabled={disabled}
                  invalid={invalid}
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
                <Ui.Input value="john@doe.com"/>
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
            controlled={true}
            data={
              @format {
                <Ui.Input placeholder="Enter email address..."/>
              }
            }/>
        }/>

      <DocBox
        title="Size"
        content={
          <p>
            "The size of the component can be set with the "

            <code>"size"</code>

            " property (in pixels)."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            highlight=[3, 7, 11]
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Input
                    size={Ui.Size::Px(12)}
                    value="Size: 12px"/>

                  <Ui.Input
                    size={Ui.Size::Px(16)}
                    value="Size: 16px"/>

                  <Ui.Input
                    size={Ui.Size::Px(20)}
                    value="Size: 20px"/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Input Delay"
        hint={
          <Ui.ContentHint
            icon={Ui.Icons:NOTE}
            type="primary">

            "If an input delay is specified the component is semi-con" \
            "trolled, meaning that during the typing its value can c" \
            "hange but it will revert back to the given value once th" \
            "e typing is settled."

          </Ui.ContentHint>
        }
        content=<{
          <p>
            "In some situations it is required to delay the change ev" \
            "ent so it only fires when the value is settled."
          </p>

          <p>
            "The delay duration can be controlled with the "

            <code>"inputDelay"</code>

            " property."
          </p>
        }>
        example={
          <Example
            verticalSpacing={20}
            highlight=[4, 9]
            data={
              @format {
                <>
                  <Ui.Input
                    onChange={(value : String) { Ui.Notifications.notifyDefault(<{ value }>) }}
                    placeholder="200ms delay..."
                    inputDelay={200}/>

                  <Ui.Input
                    onChange={(value : String) { Ui.Notifications.notifyDefault(<{ value }>) }}
                    placeholder="1000ms delay..."
                    inputDelay={1000}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Icon"
        content=<{
          <p>"An icon can be displayed in the right side of the input."</p>

          <p>"This icon is usually used to indicate something and / or have an action:"</p>

          <ul>
            <li>"An eye icon can indicate an action to how the password"</li>

            <li>"A close icon can indicate to clear the input"</li>
          </ul>
        }>
        example={
          <Example
            verticalSpacing={20}
            highlight=[3, 13]
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Input
                    iconInteractive={true}
                    icon={Ui.Icons:X}
                    value="John Doe"
                    onIconClick={
                      (event : Html.Event) {
                        Ui.Notifications.notifyDefault(<{ "Icon Clicked!" }>)
                      }
                    }/>

                  <Ui.Input
                    iconInteractive={true}
                    icon={Ui.Icons:EYE}
                    value="*****"
                    onIconClick={
                      (event : Html.Event) {
                        Ui.Notifications.notifyDefault(<{ "Icon Clicked!" }>)
                      }
                    }/>
                </>
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
            highlight=[2]
            data={
              @format {
                <Ui.Input
                  value="John Doe"
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
            controlled={true}
            highlight=[2]
            data={
              @format {
                <Ui.Input
                  value="John Doe"
                  invalid={true}/>
              }
            }/>
        }/>
    </>
  }
}
