component Documentation.Theming {
  connect Ui exposing { darkMode, DEFAULT_TOKENS }

  fun render {
    <>
      <Ui.Box title=<{ "Theming" }>>
        <p>"In Mint UI theming is achieved using CSS variables."</p>
      </Ui.Box>

      <DocBox
        title="Setting the global theme"
        content=<{
          <p>
            "To set the global theme you need to embed everything in a "
            <code>"Ui.Theme.Root"</code>
            " component. "
          </p>

          <p>"The component:"</p>

          <ul>
            <li>"Sets of the values for the design tokens."</li>
            <li>"Sets the style of scrollbars globally."</li>

            <li>
              "Sets "
              <code>"font-family"</code>
              ", "
              <code>"font-size"</code>
              ", "
              <code>"background-color"</code>
              ", and "
              <code>"color"</code>
              " of the root element."
            </li>

            <li>"Sets the style of text selections"</li>
          </ul>
        }>
        example={
          try {
            code =
              [
                "component Main {",
                "  connect Ui exposing { mobile }",
                "",
                "  fun render : Html {",
                "    <Ui.Theme.Root>",
                "      /* Content goes here. */",
                "    </Ui.Theme.Root>",
                "  }",
                "}"
              ]
              |> String.join("\n")

            <Hljs code={code}/>
          }
        }/>

      <DocBox
        title="Overriding a specific tokens"
        content=<{ "You can use the standard CSS variable to override a token." }>
        example={
          <Example
            data={
              @format {
                <div style="--primary-color: orangered;--primary-hover: red;">
                  <Ui.Container>
                    <Ui.Button
                      label="I'm orangered!"
                      type="primary"/>

                    <Ui.Checkbox checked={true}/>
                  </Ui.Container>
                </div>
              }
            }/>
        }/>

      <DocBox
        title="Tokens"
        content=<{
          <p>"You can find below all of the token and their value using the default theme."</p>
          <p>"Normal variables (light and dark value the same):"</p>

          <Ui.Table
            breakpoint={700}
            headers=[
              {
                sortable = false,
                sortKey = "name",
                label = "Name",
                shrink = false
              },
              {
                sortable = false,
                sortKey = "value",
                label = "Value",
                shrink = false
              }
            ]
            rows={
              for (token of DEFAULT_TOKENS) {
                case (token) {
                  Ui.Token::Simple name value =>
                    Maybe::Just(
                      {
                        name,
                        [
                          Ui.Cell::Code(code = "--#{name}", breakSpaces = false),
                          Ui.Cell::Code(code = value, breakSpaces = false)
                        ]
                      })

                  => Maybe::Nothing
                }
              }
              |> Array.compact
            }/>

          <p>"Light variables:"</p>

          <Ui.Table
            breakpoint={700}
            headers=[
              {
                sortable = false,
                sortKey = "name",
                label = "Name",
                shrink = false
              },
              {
                sortable = false,
                sortKey = "value",
                label = "Value",
                shrink = false
              }
            ]
            rows={
              for (token of DEFAULT_TOKENS) {
                case (token) {
                  Ui.Token::Schemed name light dark =>
                    Maybe::Just(
                      {
                        name, [
                          Ui.Cell::Code(code = "--light-#{name}", breakSpaces = false),
                          Ui.Cell::Code(code = light, breakSpaces = false)
                        ]
                      })

                  => Maybe::Nothing
                }
              }
              |> Array.compact
            }/>

          <p>"Dark variables:"</p>

          <Ui.Table
            breakpoint={700}
            headers=[
              {
                sortable = false,
                sortKey = "name",
                label = "Name",
                shrink = false
              },
              {
                sortable = false,
                sortKey = "value",
                label = "Value",
                shrink = false
              }
            ]
            rows={
              for (token of DEFAULT_TOKENS) {
                case (token) {
                  Ui.Token::Schemed name dark =>
                    Maybe::Just(
                      {
                        name,
                        [
                          Ui.Cell::Code(code = "--dark-#{name}", breakSpaces = false),
                          Ui.Cell::Code(code = dark, breakSpaces = false)
                        ]
                      })

                  => Maybe::Nothing
                }
              }
              |> Array.compact
            }/>
        }>/>
    </>
  }
}
