component Reference.Native.Select {
  connect ListItems exposing { ELEMENTS }

  state searchPlaceholder : String = "Search for an element..."
  state placeholder : String = "Select an element..."
  state value : String = "helium"
  state disabled : Bool = false
  state invalid : Bool = false
  state size : Number = 16

  get playgroundCode : String {
    "Ui.Native.Select"
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
      <Ui.Box title=<>"Ui.Native.Select"</>>
        <p>"A wrapper around the browser native select input."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.Native.Select"</code>
            " below using the controls:"
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Placeholder">
                <Ui.Input onChange={-> placeholder} value={placeholder}/>
              </Ui.Field>

              <Ui.Field label="Value">
                <Ui.Input onChange={-> value} value={value}/>
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Disabled">
                <Ui.Checkbox onChange={-> disabled} checked={disabled}/>
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Invalid">
                <Ui.Checkbox onChange={-> invalid} checked={invalid}/>
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider onChange={-> size} value={size} max={100} min={0}/>
              </Ui.Field>
            </>
            data={
              {
                <>
                  <Ui.Native.Select
                    placeholder={placeholder}
                    size={Ui.Size.Px(size)}
                    disabled={disabled}
                    onChange={-> value}
                    invalid={invalid}
                    items={ELEMENTS}
                    value={value}
                  />
                </>,
                playgroundCode
              }
            }
          />
        }
      />

      <DocBox
        title="Value"
        content=<>
          <p>
            "The selected item can be controlled with the "
            <code>"value"</code>
            " property."
          </p>

          <p>
            "It must match the "
            <code>"key"</code>
            " of the item you want to select."
          </p>
        </>
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.Native.Select
                  value="item_1"
                  items=[
                    Ui.ListItem.Item(
                      content: <>"Item 1"</>,
                      matchString: "Item 1",
                      key: "item_1"),
                    Ui.ListItem.Item(
                      content: <>"Item 2"</>,
                      matchString: "Item 2",
                      key: "item_2"),
                    Ui.ListItem.Item(
                      content: <>"Item 3"</>,
                      matchString: "Item 3",
                      key: "item_3")
                  ]
                />
              }
            }
          />
        }
      />

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
                <Ui.Native.Select placeholder="Select an item..."/>
              }
            }
          />
        }
      />

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
                  <Ui.Native.Select
                    size={Ui.Size.Px(12)}
                    value="item_1"
                    items=[
                      Ui.ListItem.Item(
                        content: <>"Item 1"</>,
                        matchString: "Item 1",
                        key: "item_1")
                    ]
                  />

                  <Ui.Native.Select
                    size={Ui.Size.Px(16)}
                    value="item_1"
                    items=[
                      Ui.ListItem.Item(
                        content: <>"Item 1"</>,
                        matchString: "Item 1",
                        key: "item_1")
                    ]
                  />

                  <Ui.Native.Select
                    size={Ui.Size.Px(20)}
                    value="item_1"
                    items=[
                      Ui.ListItem.Item(
                        content: <>"Item 1"</>,
                        matchString: "Item 1",
                        key: "item_1")
                    ]
                  />
                </>
              }
            }
          />
        }
      />

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
                <Ui.Native.Select placeholder="Disabled..." disabled={true}/>
              }
            }
          />
        }
      />

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
            data={
              @format {
                <Ui.Native.Select placeholder="Invalid..." invalid={true}/>
              }
            }
          />
        }
      />
    </>
  }
}
