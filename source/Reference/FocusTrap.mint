component Reference.FocusTrap {
  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.FocusTrap"</>>
        <p>"A component to trap keyboard focus inside itself:"</p>

        <ul>
          <li>
            "When pressing "
            <kbd>"Tab"</kbd>

            " on the last element in the component the focus will go to the " \
            "first focusable element in the component."
          </li>

          <li>
            "When pressing "
            <kbd>"Shift+Tab"</kbd>

            " on the first element in the component the focus will go to " \
            "the last focusable element in the component."
          </li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Demo"
        content={
          <p>
            "You can see a demo of a "
            <code>"Ui.FocusTrap"</code>
            " below."
          </p>
        }
        example={
          <Example
            data={
              @format {
                <Ui.FocusTrap>
                  <Ui.Content>
                    <Ui.Container orientation="vertical" align="stretch">
                      <Ui.Textarea value="Some value..."/>
                      <Ui.Input value="Some value..."/>
                      <Ui.Button label="Hello!"/>

                      <div style="height: 100px;overflow: auto;">
                        <div style="height: 200px;">"Overflown content..."</div>
                      </div>

                      <a href="/">"Home"</a>
                    </Ui.Container>
                  </Ui.Content>
                </Ui.FocusTrap>
              }
            }
          />
        }
      />
    </>
  }
}
