component Reference.Checkbox {
  state disabled : Bool = false
  state checked : Bool = false
  state size : Number = 16

  get playgroundCode : String {
    "Ui.Checkbox"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addBool("checked", checked)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Checkbox" }>>
        <p>"Checkboxes can be used to turn an option on or off."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Checkbox"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            data={
              {
                <Ui.Checkbox
                  onChange={(value : Bool) { next { checked: value } }}
                  size={Ui.Size::Px(size)}
                  disabled={disabled}
                  checked={checked}/>,
                playgroundCode
              }
            }
            controls=<{
              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size: value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Checked">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { checked: value } }}
                  checked={checked}/>

              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Disabled">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { disabled: value } }}
                  checked={disabled}/>

              </Ui.Field>
            }>/>
        }/>

      <DocBox
        title="State"
        content={
          <p>
            "The state of the component can be set with the "

            <code>"checked"</code>

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
                  <Ui.Checkbox checked={false}/>
                  <Ui.Checkbox checked={true}/>
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
                  <Ui.Checkbox size={Ui.Size::Px(12)}/>
                  <Ui.Checkbox size={Ui.Size::Px(16)}/>
                  <Ui.Checkbox size={Ui.Size::Px(20)}/>
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
            horizontalSpacing={20}
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Checkbox disabled={false}/>
                  <Ui.Checkbox disabled={true}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Change Event"
        content={
          <p>
            "The component triggers the "

            <code>"onChange"</code>

            " event when clicked."
          </p>
        }
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.Checkbox
                  onChange={
                    (value : Bool) {
                      Ui.Notifications.notifyDefault(<{ "Changed!" }>)
                    }
                  }/>
              }
            }/>
        }/>
    </>
  }
}
