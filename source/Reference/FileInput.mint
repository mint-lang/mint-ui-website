component Reference.FileInput {
  state selectAnotherLabel : String = "Click to select a different file."
  state selectLabel : String = "Select a file"
  state clearLabel : String = "Clear"
  state accept : String = "*"

  state value : Maybe(File) = Maybe.Nothing
  state size : Number = 16

  get playgroundCode : String {
    "Ui.FileInput"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addString("selectAnotherLabel", selectAnotherLabel)
    |> ComponentBuilder.addString("selectLabel", selectLabel)
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addString("clearLabel", clearLabel)
    |> ComponentBuilder.addString("accept", accept)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.FileInput"</>>
        <p>
          "An input for selecting a file. If a file is selected it shows its name, content-type and size."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.FileInput"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Accept">
                <Ui.Input onChange={-> accept} value={accept}/>
              </Ui.Field>

              <Ui.Field label="Select Label">
                <Ui.Input onChange={-> selectLabel} value={selectLabel}/>
              </Ui.Field>

              <Ui.Field label="Select Another Label">
                <Ui.Input
                  onChange={-> selectAnotherLabel}
                  value={selectAnotherLabel}
                />
              </Ui.Field>

              <Ui.Field label="Clear Label">
                <Ui.Input onChange={-> clearLabel} value={clearLabel}/>
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider onChange={-> size} value={size} max={100} min={0}/>
              </Ui.Field>
            </>
            data={
              {
                <Ui.FileInput
                  selectAnotherLabel={selectAnotherLabel}
                  selectLabel={selectLabel}
                  size={Ui.Size.Px(size)}
                  clearLabel={clearLabel}
                  onChange={-> value}
                  accept={accept}
                  value={value}
                />,
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
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.FileInput size={Ui.Size.Px(12)}/>
                  <Ui.FileInput size={Ui.Size.Px(16)}/>
                  <Ui.FileInput size={Ui.Size.Px(20)}/>
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Accept"
        content={
          <p>
            "The value for the "

            <a
              href="https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept"
              target="_blank"
            >"accept attribute"</a>

            " of a file input can be set using the"
            <code>"accept"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.FileInput selectLabel="Select an image!" accept="image/*"/>

                  <Ui.FileInput selectLabel="Select a video!" accept="video/*"/>

                  <Ui.FileInput
                    selectLabel="Select a music file!"
                    accept="audio/*"
                  />
                </>
              }
            }
          />
        }
      />
    </>
  }
}
