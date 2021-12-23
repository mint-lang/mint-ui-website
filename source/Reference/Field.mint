component Reference.Field {
  connect ListItems exposing { ORIENTATION_ITEMS, getOrientation }

  state error : String = "Error message...."
  state orientation : String = "Vertical"
  state label : String = "Label"

  get playgroundCode : String {
    try {
      input =
        "Ui.Input"
        |> ComponentBuilder.new()
        |> ComponentBuilder.addString("placeholder", "Content...")
        |> ComponentBuilder.toString()

      "Ui.Field"
      |> ComponentBuilder.new()
      |> ComponentBuilder.addExpression("error", "Maybe::Just(\"#{error}\")")
      |> ComponentBuilder.addExpression("orientation", "Ui.Field::#{orientation}")
      |> ComponentBuilder.addString("label", label)
      |> ComponentBuilder.addChild(input)
      |> ComponentBuilder.toString()
    }
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Field" }>>
        <p>"A simple form field component."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Field"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            data={
              {
                <Ui.Field
                  orientation={getOrientation(orientation)}
                  label={label}
                  error={Maybe::Just(error)}>

                  <Ui.Input placeholder="Content..."/>

                </Ui.Field>,
                playgroundCode
              }
            }
            controls=<{
              <Ui.Field label="Orientation">
                <Ui.Native.Select
                  onChange={(value : String) { next { orientation = value } }}
                  items={ORIENTATION_ITEMS}
                  value={orientation}/>
              </Ui.Field>

              <Ui.Field label="label">
                <Ui.Input
                  onChange={(value : String) { next { label = value } }}
                  value={label}/>
              </Ui.Field>

              <Ui.Field label="Error">
                <Ui.Input
                  onChange={(value : String) { next { error = value } }}
                  value={error}/>
              </Ui.Field>
            }>/>
        }/>

      <DocBox
        title="Content"
        content={<p>"Children passed will be displayed between the label and the error."</p>}
        example={
          <Example
            verticalSpacing={20}
            highlight=[2, 6, 10]
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Field label="E-mail">
                    <Ui.Input placeholder="user@example.com"/>
                  </Ui.Field>

                  <Ui.Field label="Textarea">
                    <Ui.Textarea placeholder="Content..."/>
                  </Ui.Field>

                  <Ui.Field label="Div content">
                    <div>"Content..."</div>
                  </Ui.Field>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Label"
        content={
          <p>
            "The label can be controlled using the "

            <code>"label"</code>

            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            controlled={true}
            highlight=[1, 5]
            data={
              @format {
                <>
                  <Ui.Field label="E-mail">
                    <Ui.Input placeholder="user@example.com"/>
                  </Ui.Field>

                  <Ui.Field label="Name">
                    <Ui.Input placeholder="User"/>
                  </Ui.Field>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Error"
        content={
          <p>
            "The error message can be controlled using the "

            <code>"error"</code>

            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            controlled={true}
            highlight=[1]
            data={
              @format {
                <Ui.Field
                  error={Maybe::Just("Invalid E-mail")}
                  label="E-mail">

                  <Ui.Input placeholder="user@example.com"/>

                </Ui.Field>
              }
            }/>
        }/>

      <DocBox
        title="Orientation"
        content=<{
          <p>
            "The field supports either "
            <code>"Vertical"</code>
            ","
            <code>"Horizontal"</code>
            " or "
            <code>"HorizontalReverse"</code>
            " orientation."
          </p>

          <p>
            "The "
            <code>"Horizontal"</code>
            " and "
            <code>"HorizontalReverse"</code>
            " orientations are generally for smaller inputs like checkboxes."
          </p>
        }>
        example={
          <Example
            highlight=[2, 10, 18]
            verticalSpacing={20}
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Field
                    orientation={Ui.Field::Vertical}
                    label="E-mail">

                    <Ui.Input placeholder="user@example.com"/>

                  </Ui.Field>

                  <Ui.Field
                    orientation={Ui.Field::Horizontal}
                    label="Checkbox">

                    <Ui.Checkbox/>

                  </Ui.Field>

                  <Ui.Field
                    orientation={Ui.Field::HorizontalReverse}
                    label="Checkbox">

                    <Ui.Checkbox/>

                  </Ui.Field>
                </>
              }
            }/>
        }/>
    </>
  }
}
