component Reference.ScrollToTop {
  state threshold : Number = 0
  state global : Bool = false
  state size : Number = 16

  get playgroundCode : String {
    "Ui.ScrollToTop"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("global", global)
    |> ComponentBuilder.addNumber("threshold", threshold)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.ScrollToTop" }>>
        <p>
          "A simple component that shows itself when the page is sc" \
          "rolled some and when clicking on it scrolls the page to " \
          "the top."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.ScrollToTop"</code>

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

              <Ui.Field label="Threshold (#{threshold}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { threshold: value } }}
                  value={threshold}
                  max={400}
                  min={0}/>
              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Global">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { global: value } }}
                  checked={global}/>

              </Ui.Field>
            }>
            data={
              {
                <Ui.ScrollToTop
                  size={Ui.Size::Px(size)}
                  threshold={threshold}
                  global={global}/>,
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
            highlight=[2, 7, 12]
            data={
              @format {
                <>
                  <Ui.ScrollToTop
                    size={Ui.Size::Px(12)}
                    global={false}
                    threshold={0}/>

                  <Ui.ScrollToTop
                    size={Ui.Size::Px(16)}
                    global={false}
                    threshold={0}/>

                  <Ui.ScrollToTop
                    size={Ui.Size::Px(20)}
                    global={false}
                    threshold={0}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Threshold"
        content={
          <p>
            "The scroll position which determines when to show the bu" \
            "tton can be set using "

            <code>"threshold"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[2, 6, 10]
            data={
              @format {
                <>
                  <Ui.ScrollToTop
                    threshold={400}
                    global={false}/>

                  <Ui.ScrollToTop
                    threshold={550}
                    global={false}/>

                  <Ui.ScrollToTop
                    threshold={700}
                    global={false}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Global"
        content={
          <p>
            "If the "

            <code>"global"</code>

            " property is true then the component is added to the "

            <code>"body"</code>

            " and positioned as "
            <code>"fixed"</code>
            " to the bottom right of the screen."
          </p>
        }/>
    </>
  }
}
