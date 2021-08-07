component Reference.Modal {
  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Modal" }>>
        <p>"A simple, global, customizable modal component."</p>

        <p>"Some of its features:"</p>

        <ul>
          <li>"Showing the component returns a promise which is resolved when its closed."</li>

          <li>
            "The keyboard focus is trapped in the list ("
            <kbd>"Tab"</kbd>
            " and "
            <kbd>"Shift-Tab"</kbd>
            " cyles focusable elements)."
          </li>

          <li>
            "When closed the focus is returned to the last focused el" \
            "ement before opening (which is usually the one that open" \
            "ed the modal)."
          </li>

          <li>
            "When open pressing "
            <kbd>"Esc"</kbd>
            " closes it."
          </li>

          <li>
            "After opened it will focus the first focusable item (whi" \
            "ch usually is the close icon)."
          </li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Demo"
        content={
          <p>
            "Since this is a global component you can just call "

            <code>"Ui.Modal.open"</code>

            " to show it."
          </p>
        }
        example={
          <Example
            data={
              @format {
                try {
                  content =
                    <Ui.Modal.Content
                      title=<{ "Hello There!" }>
                      icon={Ui.Icons:INFINITY}
                      content=<{ "Content" }>
                      actions=<{
                        <Ui.Button
                          onClick={(event : Html.Event) { Ui.Modal.cancel() }}
                          label="Cancel"
                          type="faded"/>

                        <Ui.Button
                          onClick={(event : Html.Event) { Ui.Modal.hide() }}
                          label="Cool!"/>
                      }>/>

                  clickHandler =
                    (event : Html.Event) : Promise(Never, Void) {
                      sequence {
                        Ui.Modal.show(content)
                        Ui.Notifications.notifyDefault(<{ "Closed!" }>)
                      } catch {
                        Ui.Notifications.notifyDefault(<{ "Cancelled!" }>)
                      }
                    }

                  <Ui.Button
                    onClick={clickHandler}
                    label="Click to Open"/>
                }
              }
            }/>
        }/>

      <DocBox
        title="Custom Content"
        content={<p>"The given content is shown in the center of the screen above the backdrop."</p>}
        example={
          <Example
            data={
              @format {
                try {
                  content =
                    <Ui.Button
                      onClick={(event : Html.Event) { Ui.Modal.hide() }}
                      label="Cool!"/>

                  clickHandler =
                    (event : Html.Event) {
                      sequence {
                        Ui.Modal.show(content)
                        Ui.Notifications.notifyDefault(<{ "Closed!" }>)
                      } catch {
                        Ui.Notifications.notifyDefault(<{ "Cancelled!" }>)
                      }
                    }

                  <Ui.Button
                    onClick={clickHandler}
                    label="Click to Open"/>
                }
              }
            }/>
        }/>

      <DocBox
        title="Advanced Usage"
        content={
          <p>
            "If you need more control over the modal you can call: "

            <code>"Ui.Modal.showWithOptions(content, zIndex, transitionDuration, openCallback)"</code>
          </p>
        }
        example={
          <Example
            data={
              @format {
                try {
                  content =
                    <Ui.Button
                      onClick={(event : Html.Event) { Ui.Modal.hide() }}
                      label="Cool!"/>

                  clickHandler =
                    (event : Html.Event) {
                      sequence {
                        Ui.Modal.showWithOptions(
                          content,
                          900,
                          240,
                          () { Ui.Notifications.notifyDefault(<{ "Opened!" }>) })

                        Ui.Notifications.notifyDefault(<{ "Closed!" }>)
                      } catch {
                        Ui.Notifications.notifyDefault(<{ "Cancelled!" }>)
                      }
                    }

                  <Ui.Button
                    onClick={clickHandler}
                    label="Click to Open"/>
                }
              }
            }/>
        }/>
    </>
  }
}
