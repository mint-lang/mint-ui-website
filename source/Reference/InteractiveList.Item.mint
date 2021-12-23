component Reference.InteractiveList.Item {
  state intended : Bool = false
  state selected : Bool = false
  state size : Number = 16

  const ON_CLICK =
    @format {
      (event : Html.Event) { Ui.Notifications.notifyDefault(<{ "Clicked" }>) }
    }

  get playgroundCode : String {
    "Ui.InteractiveList.Item"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addExpression("onClick", ON_CLICK[1])
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("intended", intended)
    |> ComponentBuilder.addBool("selected", selected)
    |> ComponentBuilder.addStringChild("Some content...")
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.InteractiveList.Item" }>>
        <p>
          "A component to display a "
          <code>"Ui.ListItem"</code>
          " for the interactive list."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.InteractiveList.Item"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size = value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Intended">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { intended = value } }}
                  checked={intended}/>

              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Selected">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { selected = value } }}
                  checked={selected}/>

              </Ui.Field>
            }>
            data={
              {
                <Ui.InteractiveList.Item
                  size={Ui.Size::Px(size)}
                  onClick={ON_CLICK[0]}
                  intended={intended}
                  selected={selected}>

                  "Some content..."

                </Ui.InteractiveList.Item>,
                playgroundCode
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
            highlight=[2, 10, 18]
            data={
              @format {
                <>
                  <Ui.InteractiveList.Item
                    size={Ui.Size::Px(12)}
                    intended={true}>

                    "Some content..."

                  </Ui.InteractiveList.Item>

                  <Ui.InteractiveList.Item
                    size={Ui.Size::Px(16)}
                    intended={true}>

                    "Some content..."

                  </Ui.InteractiveList.Item>

                  <Ui.InteractiveList.Item
                    size={Ui.Size::Px(20)}
                    intended={true}>

                    "Some content..."

                  </Ui.InteractiveList.Item>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Intended"
        content={
          <p>
            "The component can marked as intended to be selected using the "

            <code>"intended"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.InteractiveList.Item intended={true}>
                    "Some content..."
                  </Ui.InteractiveList.Item>

                  <Ui.InteractiveList.Item intended={false}>
                    "Some content..."
                  </Ui.InteractiveList.Item>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Selected"
        content={
          <p>
            "The component can marked as selected using the "

            <code>"selected"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.InteractiveList.Item selected={true}>
                    "Some content..."
                  </Ui.InteractiveList.Item>

                  <Ui.InteractiveList.Item selected={false}>
                    "Some content..."
                  </Ui.InteractiveList.Item>
                </>
              }
            }/>
        }/>
    </>
  }
}
