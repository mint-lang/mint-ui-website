component Reference.CircularProgress {
  state thickness : Number = 0.3125
  state current : Number = 20
  state width : Number = 12
  state size : Number = 16
  state max : Number = 100

  get playgroundCode : String {
    "Ui.CircularProgress"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addNumber("thickness", thickness)
    |> ComponentBuilder.addNumber("current", current)
    |> ComponentBuilder.addNumber("width", width)
    |> ComponentBuilder.addNumber("max", max)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.CircularProgress" }>>
        <p>
          "A circular progress bar displaying progress as a circle " \
          "and the percentage and the actual values as text."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.CircularProgress"</code>

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

              <Ui.Field label="Thickness (#{thickness}em)">
                <Ui.Slider
                  onChange={(value : Number) { next { thickness = value } }}
                  value={thickness}
                  step={0.1}
                  max={10}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Width (#{width})">
                <Ui.Slider
                  onChange={(value : Number) { next { width = value } }}
                  value={width}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Max (#{max})">
                <Ui.Slider
                  onChange={
                    (value : Number) {
                      next
                        {
                          current = Math.clamp(0, current, value),
                          max = value
                        }
                    }
                  }
                  value={max}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Current (#{current})">
                <Ui.Slider
                  onChange={
                    (value : Number) {
                      next
                        {
                          max = Math.max(value, max),
                          current = value
                        }
                    }
                  }
                  value={current}
                  max={100}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.CircularProgress
                  size={Ui.Size::Px(size)}
                  thickness={thickness}
                  current={current}
                  width={width}
                  max={max}/>,
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
            highlight=[2, 6, 10]
            data={
              @format {
                <>
                  <Ui.CircularProgress
                    size={Ui.Size::Px(12)}
                    current={50}/>

                  <Ui.CircularProgress
                    size={Ui.Size::Px(16)}
                    current={50}/>

                  <Ui.CircularProgress
                    size={Ui.Size::Px(20)}
                    current={50}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Current"
        content={
          <p>
            "The current value can be set with the "

            <code>"current"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.CircularProgress current={0}/>
                  <Ui.CircularProgress current={25}/>
                  <Ui.CircularProgress current={50}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Max"
        content={
          <p>
            "The maximum value can be set with the "

            <code>"max"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[3, 7, 11]
            data={
              @format {
                <>
                  <Ui.CircularProgress
                    current={50}
                    max={120}/>

                  <Ui.CircularProgress
                    current={50}
                    max={200}/>

                  <Ui.CircularProgress
                    current={50}
                    max={400}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Max"
        content={
          <p>
            "The maximum value can be set with the "

            <code>"max"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[3, 7, 11]
            data={
              @format {
                <>
                  <Ui.CircularProgress
                    current={50}
                    max={120}/>

                  <Ui.CircularProgress
                    current={50}
                    max={200}/>

                  <Ui.CircularProgress
                    current={50}
                    max={400}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Thickness"
        content={
          <p>
            "The thickness of the circle can be set with the "

            <code>"thickness"</code>

            " property (in ems)."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[2, 6, 10]
            data={
              @format {
                <>
                  <Ui.CircularProgress
                    thickness={0.25}
                    current={62}/>

                  <Ui.CircularProgress
                    thickness={0.5}
                    current={62}/>

                  <Ui.CircularProgress
                    thickness={0.75}
                    current={62}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Format"
        content={
          <p>
            "The "

            <code>"format"</code>

            " property can be used to format the numeric values."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[2, 6, 10]
            data={
              @format {
                <>
                  <Ui.CircularProgress
                    format={FileSize.format}
                    current={624}
                    max={1024}/>
                </>
              }
            }/>
        }/>
    </>
  }
}
