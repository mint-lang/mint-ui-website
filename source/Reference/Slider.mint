component Reference.Slider {
  state currentValue : Number = 50
  state disabled : Bool = false
  state size : Number = 16
  state step : Number = 1
  state max : Number = 100
  state min : Number = 0

  get playgroundCode : String {
    "Ui.Slider"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addNumber("value", currentValue)
    |> ComponentBuilder.addNumber("max", max)
    |> ComponentBuilder.addNumber("min", min)
    |> ComponentBuilder.addNumber("step", step)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Slider" }>>
        <p>
          "This component lets the user specify a numeric value whi" \
          "ch must be no less than a given value, and no more than " \
          "another given value."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Slider"</code>

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

              <Ui.Field label="Value (#{currentValue})">
                <Ui.Slider
                  onChange={(value : Number) { next { currentValue: value } }}
                  value={currentValue}
                  max={max}
                  min={min}/>
              </Ui.Field>

              <Ui.Field label="Min (#{min})">
                <Ui.Slider
                  onChange={
                    (value : Number) {
                      next
                        {
                          currentValue: Math.clamp(currentValue, value, max),
                          max: Math.max(value, max),
                          min: value
                        }
                    }
                  }
                  value={min}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Max (#{max})">
                <Ui.Slider
                  onChange={
                    (value : Number) {
                      next
                        {
                          currentValue: Math.clamp(currentValue, min, value),
                          min: Math.min(value, min),
                          max: value
                        }
                    }
                  }
                  value={max}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Step (#{step})">
                <Ui.Slider
                  onChange={(value : Number) { next { step: value } }}
                  value={step}
                  max={10}
                  min={1}/>
              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Disabled">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { disabled: value } }}
                  checked={disabled}/>

              </Ui.Field>
            }>
            data={
              {
                <Ui.Slider
                  onChange={(value : Number) { next { currentValue: value } }}
                  size={Ui.Size::Px(size)}
                  value={currentValue}
                  disabled={disabled}
                  step={step}
                  max={max}
                  min={min}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Value"
        content={
          <p>
            "The value of the component can be set with the "

            <code>"value"</code>

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
                  <Ui.Slider value={25}/>
                  <Ui.Slider value={50}/>
                  <Ui.Slider value={76}/>
                </>
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
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Slider
                    size={Ui.Size::Px(12)}
                    value={50}/>

                  <Ui.Slider
                    size={Ui.Size::Px(16)}
                    value={50}/>

                  <Ui.Slider
                    size={Ui.Size::Px(20)}
                    value={50}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Min"
        content={
          <p>
            "The minimum value can be set with the "

            <code>"min"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[3, 7, 11]
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Slider
                    value={80}
                    min={25}/>

                  <Ui.Slider
                    value={80}
                    min={50}/>

                  <Ui.Slider
                    value={80}
                    min={75}/>
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
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Slider
                    value={10}
                    max={20}/>

                  <Ui.Slider
                    value={10}
                    max={40}/>

                  <Ui.Slider
                    value={10}
                    max={60}/>
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
            horizontalSpacing={20}
            controlled={true}
            highlight=[2, 6]
            data={
              @format {
                <>
                  <Ui.Slider
                    disabled={true}
                    value={50}/>

                  <Ui.Slider
                    disabled={false}
                    value={50}/>
                </>
              }
            }/>
        }/>
    </>
  }
}
