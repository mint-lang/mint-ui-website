component Reference.Native.AutoComplete {
  connect ListItems exposing { SIMPLE_ELEMENTS }

  state placeholder : String = "Select an element..."
  state disabled : Bool = false
  state invalid : Bool = false
  state value : String = ""
  state size : Number = 16

  get playgroundCode : String {
    "Ui.Native.AutoComplete"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addString("placeholder", placeholder)
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addExpression("options", "ELEMENTS")
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addBool("invalid", invalid)
    |> ComponentBuilder.addString("value", value)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Native.AutoComplete" }>>
        <p>
          "This component uses the browsers "

          <a
            href="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/datalist"
            target="_blank">

            "native autocomplete capabilities."

          </a>
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Native.AutoComplete"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Placeholder">
                <Ui.Input
                  onChange={(value : String) { next { placeholder: value } }}
                  value={placeholder}/>
              </Ui.Field>

              <Ui.Field label="Value">
                <Ui.Input
                  onChange={(value : String) { next { value: value } }}
                  value={value}/>
              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Disabled">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { disabled: value } }}
                  checked={disabled}/>

              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Invalid">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { invalid: value } }}
                  checked={invalid}/>

              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size: value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.Native.AutoComplete
                  onChange={(value : String) { next { value: value } }}
                  options={SIMPLE_ELEMENTS}
                  placeholder={placeholder}
                  size={Ui.Size::Px(size)}
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
                <Ui.Native.AutoComplete value="Item 1"/>
              }
            }/>
        }/>

      <DocBox
        title="Options"
        content={
          <p>
            "The options can be controlled with the "

            <code>"options"</code>

            " property."
          </p>
        }
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.Native.AutoComplete
                  options=[
                    "Item 1",
                    "Item 2",
                    "Item 3"
                  ]/>
              }
            }/>
        }/>

      <DocBox
        title="Placeholder"
        content={
          <p>
            "The placeholder can be changed with the "

            <code>"placeholder"</code>

            " property. It is only visible if none of items match the given value."
          </p>
        }
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.Native.AutoComplete placeholder="Select an item..."/>
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
            highlight=[2, 7, 12]
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Native.AutoComplete
                    size={Ui.Size::Px(12)}
                    options=["Item 1"]
                    value="Item 1"/>

                  <Ui.Native.AutoComplete
                    size={Ui.Size::Px(16)}
                    options=["Item 1"]
                    value="Item 1"/>

                  <Ui.Native.AutoComplete
                    size={Ui.Size::Px(20)}
                    options=["Item 1"]
                    value="Item 1"/>
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
            controlled={true}
            highlight=[2]
            data={
              @format {
                <Ui.Native.AutoComplete
                  placeholder="Disabled..."
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
                <Ui.Native.AutoComplete
                  placeholder="Invalid..."
                  invalid={true}/>
              }
            }/>
        }/>
    </>
  }
}
