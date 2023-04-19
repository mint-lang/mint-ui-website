component Reference.DarkModeToggle {
  state size : Number = 16

  get playgroundCode : String {
    "Ui.DarkModeToggle"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.DarkModeToggle" }>>
        <p>"A button like component to toggle between light and dark modes."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.DarkModeToggle"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
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
                <Ui.DarkModeToggle size={Ui.Size::Px(size)}/>,
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
                  <Ui.DarkModeToggle size={Ui.Size::Px(12)}/>
                  <Ui.DarkModeToggle size={Ui.Size::Px(16)}/>
                  <Ui.DarkModeToggle size={Ui.Size::Px(20)}/>
                </>
              }
            }/>
        }/>
    </>
  }
}
