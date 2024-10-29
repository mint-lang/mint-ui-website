component Reference.Modal.Base {
  state closeOnOutsideClick : Bool = true
  state transitionDuration : Number = 240
  state zIndex : Number = 100
  state open : Bool = false

  get playgroundCode : String {
    let button =
      "Ui.Button"
      |> ComponentBuilder.new()
      |> ComponentBuilder.addExpression("onClick",
        "(event : Html.Event) { /* Handle event...*/ }")
      |> ComponentBuilder.addString("label", "Close")
      |> ComponentBuilder.toString()

    "Ui.Modal.Base"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addBool("closeOnOutsideClick", closeOnOutsideClick)
    |> ComponentBuilder.addNumber("transitionDuration", transitionDuration)
    |> ComponentBuilder.addNumber("zIndex", zIndex)
    |> ComponentBuilder.addBool("open", open)
    |> ComponentBuilder.addChild(button)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Modal.Base"</>>
        <p>
          "The base component for a modal, this contains the backdrop and " \
          "the centered content with transitions."
        </p>

        <p>"Use this when you want to create a custom modal."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.Modal.Base"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Transition Duration (#{transitionDuration}ms)">
                <Ui.Slider
                  onChange={-> transitionDuration}
                  value={transitionDuration}
                  max={2000}
                  min={0}
                />
              </Ui.Field>

              <Ui.Field label="Z-index (#{zIndex})">
                <Ui.Slider
                  onChange={-> zIndex}
                  value={zIndex}
                  min={-100}
                  max={100}
                />
              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field.Horizontal}
                label="Close on Outside Click"
              >
                <Ui.Checkbox
                  onChange={-> closeOnOutsideClick}
                  checked={closeOnOutsideClick}
                />
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Open">
                <Ui.Checkbox onChange={-> open} checked={open}/>
              </Ui.Field>
            </>
            data={
              {
                <>
                  <Ui.Button
                    onClick={(event : Html.Event) { next { open: true } }}
                    label="Open"
                  />

                  <Ui.Modal.Base
                    closeOnOutsideClick={closeOnOutsideClick}
                    transitionDuration={transitionDuration}
                    zIndex={zIndex}
                    open={open}
                    onClose={
                      () {
                        next { open: false }
                        Ui.Notifications.notifyDefault(<>"Modal closed!"</>)
                      }
                    }
                  >
                    <Ui.Button
                      onClick={(event : Html.Event) { next { open: false } }}
                      label="Close"
                    />
                  </Ui.Modal.Base>
                </>,
                playgroundCode
              }
            }
          />
        }
      />
    </>
  }
}
