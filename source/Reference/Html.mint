component Reference.Html {
  state content : String = "<div>Some Content<div>"

  get playgroundCode : String {
    "Ui.Html"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addString("content", content)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Html"</>><p>"A component to display raw HTML."</p></Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.Html"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Html">
                <Ui.Textarea onChange={-> content} value={content}/>
              </Ui.Field>
            </>
            data={{<Ui.Html content={content}/>, playgroundCode}}
          />
        }
      />

      <Ui.ContentHint icon={Ui.Icons.ALERT} type="danger">
        "Make sure that you trust the HTML inserted this way!  In general, " \
        "setting HTML from code is risky because it’s easy to inadvertently " \
        "expose your users to a cross-site scripting (XSS) attack."
      </Ui.ContentHint>
    </>
  }
}
