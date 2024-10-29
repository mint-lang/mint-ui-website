component Reference.Content {
  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Content"</>>
        <p>
          "This component is used to render text like content. It has " \
          "styles for HTML tags like headings, list, paragraphs and code."
        </p>
      </Ui.Box>

      <DocBox
        title="Demo"
        content={<p>"You can check below how each tag renders."</p>}
        example={
          <Example
            data={
              @format {
                <Ui.Content>
                  <h1>"Heading 1"</h1>
                  <h2>"Heading 2"</h2>
                  <h3>"Heading 3"</h3>
                  <h4>"Heading 4"</h4>

                  <p>"Lists:"</p>

                  <ul>
                    <li>"List item 1"</li>
                    <li>"List item 2"</li>
                    <li>"List item 3"</li>
                    <li>"List item 4"</li>
                  </ul>

                  <ol>
                    <li>"List item 1"</li>
                    <li>"List item 2"</li>
                    <li>"List item 3"</li>
                    <li>"List item 4"</li>
                  </ol>

                  <pre><code>"<div>Some code!</div>"</code></pre>

                  <p><a href="/">"Link to home..."</a></p>
                </Ui.Content>
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
            data={
              @format {
                <>
                  <Ui.Content size={Ui.Size.Px(12)}>
                    <p>
                      "Lorem ipsum dolor sit amet, consectetur adipiscing " \
                      "elit, sed do eiusmod tempor incididunt ut labore et " \
                      "dolore magna aliqua."
                    </p>
                  </Ui.Content>

                  <Ui.Content size={Ui.Size.Px(16)}>
                    <p>
                      "Lorem ipsum dolor sit amet, consectetur adipiscing " \
                      "elit, sed do eiusmod tempor incididunt ut labore et " \
                      "dolore magna aliqua."
                    </p>
                  </Ui.Content>

                  <Ui.Content size={Ui.Size.Px(20)}>
                    <p>
                      "Lorem ipsum dolor sit amet, consectetur adipiscing " \
                      "elit, sed do eiusmod tempor incididunt ut labore et " \
                      "dolore magna aliqua."
                    </p>
                  </Ui.Content>
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Text Alignment"
        content={
          <p>
            "The text alignment of the component can be controlled with the "
            <code>"textAlign"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <div style="width: 280px">
                    <Ui.Content textAlign="left">
                      <p>
                        "Lorem ipsum dolor sit amet, consectetur adipiscing " \
                        "elit, sed do eiusmod tempor incididunt ut labore " \
                        "et dolore magna aliqua."
                      </p>
                    </Ui.Content>
                  </div>

                  <div style="width: 280px">
                    <Ui.Content textAlign="center">
                      <p>
                        "Lorem ipsum dolor sit amet, consectetur adipiscing " \
                        "elit, sed do eiusmod tempor incididunt ut labore " \
                        "et dolore magna aliqua."
                      </p>
                    </Ui.Content>
                  </div>

                  <div style="width: 280px">
                    <Ui.Content textAlign="right">
                      <p>
                        "Lorem ipsum dolor sit amet, consectetur adipiscing " \
                        "elit, sed do eiusmod tempor incididunt ut labore " \
                        "et dolore magna aliqua."
                      </p>
                    </Ui.Content>
                  </div>
                </>
              }
            }
          />
        }
      />
    </>
  }
}
