/* This is a template for a components reference page. */
component Reference.Component {
  state size : Number = 16

  get playgroundCode : String {
    "Ui.Component"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Component" }>>
        <p>""</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Component"</code>

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
            }>
            data={
              {
                <div/>,
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
            data={
              @format {
                <>

                </>
              }
            }/>
        }/>
    </>
  }
}
