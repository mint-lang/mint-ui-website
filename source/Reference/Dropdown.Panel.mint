component Reference.Dropdown.Panel {
  state title : String = "Title"
  state width : String = "auto"
  state size : Number = 16

  get playgroundCode : String {
    "Ui.Dropdown.Panel"
    |> ComponentBuilder.new
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addStringHtml("title", title)
    |> ComponentBuilder.addString("width", width)
    |> ComponentBuilder.addStringChild("Content")
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Dropdown.Panel" }>>
        <p>"A component to use with dropdowns, but can be used standalone as well."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Dropdown.Panel"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Title">
                <Ui.Input
                  onChange={(value : String) { next { title: value } }}
                  value={title}/>
              </Ui.Field>

              <Ui.Field label="Width">
                <Ui.Input
                  onChange={(value : String) { next { width: value } }}
                  value={width}/>
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
                <Ui.Dropdown.Panel
                  size={Ui.Size::Px(size)}
                  title=<{ title }>
                  width={width}>

                  "Content"

                </Ui.Dropdown.Panel>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Title"
        content={
          <p>
            "The title can be controlled with the "

            <code>"title"</code>

            " property."
          </p>
        }
        hint={
          <Ui.ContentHint icon={Ui.Icons:NOTE}>
            "If the title is blank or omitted it will be hidden."
          </Ui.ContentHint>
        }
        example={
          <Example
            highlight=[3, 8, 9, 10, 11, 12, 13]
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>

                  <Ui.Dropdown.Panel title=<{ "Title" }>>
                    "Content"
                  </Ui.Dropdown.Panel>

                  <Ui.Dropdown.Panel
                    title={
                      <Ui.Container>
                        <Ui.Icon icon={Ui.Icons:BEAKER}/>
                        "Lab"
                      </Ui.Container>
                    }>

                    "Content"

                  </Ui.Dropdown.Panel>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Size"
        content={
          <p>
            "The size can be controlled with the "

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
                  <Ui.Dropdown.Panel
                    size={Ui.Size::Px(12)}
                    title=<{ "Title" }>>

                    "Content"

                  </Ui.Dropdown.Panel>

                  <Ui.Dropdown.Panel
                    size={Ui.Size::Px(16)}
                    title=<{ "Title" }>>

                    "Content"

                  </Ui.Dropdown.Panel>

                  <Ui.Dropdown.Panel
                    size={Ui.Size::Px(20)}
                    title=<{ "Title" }>>

                    "Content"

                  </Ui.Dropdown.Panel>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Width"
        content={
          <p>
            "The width can be controlled with the "

            <code>"width"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[1, 5, 9]
            data={
              @format {
                <>
                  <Ui.Dropdown.Panel width="auto">
                    "Content"
                  </Ui.Dropdown.Panel>

                  <Ui.Dropdown.Panel width="100px">
                    "Content"
                  </Ui.Dropdown.Panel>

                  <Ui.Dropdown.Panel width="200px">
                    "Content"
                  </Ui.Dropdown.Panel>
                </>
              }
            }/>
        }/>
    </>
  }
}
