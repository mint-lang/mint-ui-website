component Reference.Select {
  connect ListItems exposing { POSITIONS, ELEMENTS }

  state placeholder : String = "Select an element..."
  state position : String = "BottomLeft"
  state value : String = ""

  state matchWidth : Bool = false
  state disabled : Bool = false
  state invalid : Bool = false

  state offset : Number = 10
  state size : Number = 16

  get playgroundCode : String {
    "Ui.Select"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addExpression("position", "Ui.Position::#{position}")
    |> ComponentBuilder.addString("placeholder", placeholder)
    |> ComponentBuilder.addExpression("items", "ELEMENTS")
    |> ComponentBuilder.addBool("matchWidth", matchWidth)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addBool("invalid", invalid)
    |> ComponentBuilder.addString("value", value)
    |> ComponentBuilder.addNumber("offset", offset)
    |> ComponentBuilder.addNumber("size", size)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Select" }>>
        <p>"An input for selecting one element from a list using a dropdown."</p>

        <p>
          "It uses the "
          <code>"Ui.Picker"</code>
          " and "
          <code>"Ui.InteractiveList"</code>
          " to create a select box."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Select"</code>

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
                <Ui.Native.Select
                  onChange={(value : String) { next { value = value } }}
                  items={ELEMENTS}
                  value={value}/>
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
                <Ui.Select
                  onChange={(value : String) { next { value = value } }}
                  position={Ui.Position.fromString(position)}
                  placeholder={placeholder}
                  size={Ui.Size::Px(size)}
                  matchWidth={matchWidth}
                  disabled={disabled}
                  invalid={invalid}
                  items={ELEMENTS}
                  offset={offset}
                  value={value}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Items"
        content={
          <p>
            "The component displays items which are provided using the "

            <code>"items"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight={Array.range(2, 11)}
            data={
              @format {
                <Ui.Select
                  placeholder="Select something!"
                  items=[
                    Ui.ListItem::Item(
                      content = <{ "Something" }>,
                      matchString = "something",
                      key = "something"),
                    Ui.ListItem::Item(
                      content = <{ "An other thing" }>,
                      matchString = "an other thing",
                      key = "an-other-thing")
                  ]/>
              }
            }/>
        }/>

      <DocBox
        title="Value"
        content={
          <p>
            "The selected item can be controlled using the "

            <code>"value"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[1]
            data={
              @format {
                <Ui.Select
                  value="something"
                  items=[
                    Ui.ListItem::Item(
                      content = <{ "Something" }>,
                      matchString = "something",
                      key = "something"),
                    Ui.ListItem::Item(
                      content = <{ "An other thing" }>,
                      matchString = "an other thing",
                      key = "an-other-thing")
                  ]/>
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
                  <Ui.Select
                    placeholder="Select something!"
                    size={Ui.Size::Px(12)}
                    items={ELEMENTS}/>

                  <Ui.Select
                    placeholder="Select something!"
                    size={Ui.Size::Px(16)}
                    items={ELEMENTS}/>

                  <Ui.Select
                    placeholder="Select something!"
                    size={Ui.Size::Px(20)}
                    items={ELEMENTS}/>
                </>
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
                <Ui.Select
                  placeholder="Select something!"
                  items={ELEMENTS}
                  invalid={true}/>
              }
            }/>
        }/>

      <DocBox
        title="Disabled"
        content={
          <p>
            "The component can be marked disabled using the "

            <code>"disabled"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[3]
            data={
              @format {
                <Ui.Select
                  placeholder="Select something!"
                  items={ELEMENTS}
                  disabled={true}/>
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
                <Ui.Select
                  placeholder="Select something!"
                  items={ELEMENTS}/>
              }
            }/>
        }/>

      <DocBox
        title="Match Width"
        content={
          <p>
            "Whether or not the panel should match the width the element can be controlled with the "

            <code>"matchWidth"</code>

            " property. For more information check out the "

            <a href="/components/ui-dropdown#match-width">
              "same property"
            </a>

            " of the "
            <code>"Ui.Dropdown"</code>
          </p>
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
