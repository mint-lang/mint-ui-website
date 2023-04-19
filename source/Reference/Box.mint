component Reference.Box {
  state content : String = "Content"
  state title : String = "Title"
  state label : String = "Label"
  state size : Number = 16

  get playgroundCode : String {
    "Ui.Box"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addStringHtml("title", title)
    |> ComponentBuilder.addStringHtml("label", label)
    |> ComponentBuilder.addStringChild(content)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Box" }>>
        <p>
          "A component to group together things and actions that ar" \
          "e related to that content."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Box"</code>

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

              <Ui.Field label="Label">
                <Ui.Input
                  onChange={(value : String) { next { label: value } }}
                  value={label}/>
              </Ui.Field>

              <Ui.Field label="Content">
                <Ui.Input
                  onChange={(value : String) { next { content: value } }}
                  value={content}/>
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
                <Ui.Box
                  size={Ui.Size::Px(size)}
                  title=<{ title }>
                  label=<{ label }>>

                  <{ content }>

                </Ui.Box>,
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
            highlight=[2, 11, 20]
            data={
              @format {
                <>
                  <Ui.Box
                    size={Ui.Size::Px(12)}
                    title=<{ "Title" }>
                    label=<{ "Label" }>>

                    "Content"

                  </Ui.Box>

                  <Ui.Box
                    size={Ui.Size::Px(16)}
                    title=<{ "Title" }>
                    label=<{ "Label" }>>

                    "Content"

                  </Ui.Box>

                  <Ui.Box
                    size={Ui.Size::Px(20)}
                    title=<{ "Title" }>
                    label=<{ "Label" }>>

                    "Content"

                  </Ui.Box>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Title"
        content={
          <p>
            "The title of the box can be set with the "

            <code>"title"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[1, 6, 7, 8, 9, 10, 11]
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Box title=<{ "Title" }>>
                    "Content"
                  </Ui.Box>

                  <Ui.Box
                    title={
                      <Ui.Container>
                        <Ui.Icon icon={Ui.Icons:BUG}/>
                        "Title with an icon!"
                      </Ui.Container>
                    }>

                    "Content"

                  </Ui.Box>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Label"
        content={
          <p>
            "The label of the box can be set with the "

            <code>"label"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[1, 6, 7, 8, 9, 10, 11]
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Box label=<{ "Label" }>>
                    "Content"
                  </Ui.Box>

                  <Ui.Box
                    label={
                      <Ui.Container>
                        <Ui.Icon icon={Ui.Icons:BUG}/>
                        "Label with an icon!"
                      </Ui.Container>
                    }>

                    "Content"

                  </Ui.Box>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Content"
        content={<p>"The children rendered as the content of the box."</p>}
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Box>"Lorem ipsum dolor sit amet, consectetur..."</Ui.Box>

                  <Ui.Box>
                    <Ui.Button label="A button..."/>
                  </Ui.Box>
                </>
              }
            }/>
        }/>
    </>
  }
}
