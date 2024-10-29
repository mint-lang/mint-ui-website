/* This is a template for a components reference page. */
component Reference.ImageCrop {
  state embedded : Bool = false
  state size : Number = 16

  state value : Ui.ImageCrop.Value =
    {
      source: @asset(../../assets/images/white-beach.jpg),
      height: 0.5,
      width: 0.5,
      y: 0.25,
      x: 0.25
    }

  style base {
    display: grid;
    height: 300px;
  }

  get playgroundCode : String {
    let stringValue =
      <<~MINT
      {
        source = @asset(../../assets/images/white-beach.jpg),
        height = #{toFixed(value.height)},
        width = #{toFixed(value.width)},
        y = #{toFixed(value.y)},
        x = #{toFixed(value.x)}
      }
      MINT

    "Ui.ImageCrop"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("embedded", embedded)
    |> ComponentBuilder.addExpression("value", stringValue)
    |> ComponentBuilder.toString()
  }

  fun toFixed (number : Number) : String {
    `#{number}.toFixed(2)`
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.ImageCrop"</>>
        <p>"A simple image cropper component."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.ImageCrop"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            fullWidth={true}
            controls=<>
              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider onChange={-> size} value={size} max={100} min={0}/>
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Embeeded">
                <Ui.Checkbox onChange={-> embedded} checked={embedded}/>
              </Ui.Field>
            </>
            data={
              {
                <div::base>
                  <Ui.ImageCrop
                    size={Ui.Size.Px(size)}
                    onChange={-> value}
                    embedded={embedded}
                    value={value}
                  />
                </div>,
                playgroundCode
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
            verticalSpacing={20}
            controlled={true}
            data={
              @format {
                <>
                  <Ui.ImageCrop
                    size={Ui.Size.Px(12)}
                    value={
                      {
                        source: @asset(../../assets/images/white-beach.jpg),
                        height: 0.5,
                        width: 0.5,
                        y: 0.25,
                        x: 0.25
                      }
                    }
                  />

                  <Ui.ImageCrop
                    size={Ui.Size.Px(16)}
                    value={
                      {
                        source: @asset(../../assets/images/white-beach.jpg),
                        height: 0.5,
                        width: 0.5,
                        y: 0.25,
                        x: 0.25
                      }
                    }
                  />

                  <Ui.ImageCrop
                    size={Ui.Size.Px(20)}
                    value={
                      {
                        source: @asset(../../assets/images/white-beach.jpg),
                        height: 0.5,
                        width: 0.5,
                        y: 0.25,
                        x: 0.25
                      }
                    }
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Embedded"
        content=<>
          <p>
            "The image cropper can be embedded by setting "
            <code>"embedded"</code>
            " property to "
            <code>"true"</code>
          </p>

          <p>"This will remove the background, border and padding."</p>
        </>
        example={
          <Example
            verticalSpacing={20}
            controlled={true}
            data={
              @format {
                <Ui.ImageCrop
                  embedded={true}
                  value={
                    {
                      source: @asset(../../assets/images/white-beach.jpg),
                      height: 0.5,
                      width: 0.5,
                      y: 0.25,
                      x: 0.25
                    }
                  }
                />
              }
            }
          />
        }
      />
    </>
  }
}
