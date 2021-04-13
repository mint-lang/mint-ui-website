component Page.Examples {
  connect Application exposing { EXAMPLES }
  connect Ui exposing { mobile, darkMode }

  style examples {
    align-content: start;
    align-items: start;
    grid-gap: 2em;
    display: grid;
  }

  style example {
    border: 3px solid var(--content-color);
    border-bottom: 0;

    background: var(--background-color);
    height: 25em;
    width: 100%;

    box-sizing: border-box;
    position: relative;
    overflow: hidden;

    > * {
      min-height: inherit;
    }

    &::after {
      content: "";

      background: linear-gradient(rgba(0,0,0,0) 80%, var(--background-color) 95%);
      display: block;
      height: 100%;
      width: 100%;

      position: absolute;
      z-index: 1;
      bottom: 0;
      left: 0;
      top: 0;
    }
  }

  fun render : Html {
    <div::examples>
      <Ui.Content>
        <h1>"Examples"</h1>

        <p>
          "Here you can find some pages that are built with Mint UI" \
          ", feel free use them as examples the sources are availab" \
          "le on Github."
        </p>

        <p>
          "Most of the examples are static, some have some interact" \
          "ions but all of them are not functional (in the login pa" \
          "ge you cannot log in etc...) - since they are built only" \
          " to showcase components."
        </p>
      </Ui.Content>

      <Ui.Grid
        gap={Ui.Size::Em(2)}
        width={
          if (mobile) {
            Ui.Size::Inherit
          } else {
            Ui.Size::Em(30)
          }
        }>

        for (name, page of EXAMPLES) {
          <Ui.Card href="/examples/#{String.parameterize(name)}">
            <div::example>
              <Ui.AvoidFocus>
                <{ page[1] }>
              </Ui.AvoidFocus>
            </div>

            <Ui.Card.Container
              content={
                <Ui.Container justify="space-between">
                  <{ page[0] }>

                  <Ui.Button
                    href="https://github.com/mint-lang/mint-ui-website/blob/master/source/Examples/#{page[2]}"
                    iconBefore={Ui.Icons:CODE}
                    size={Ui.Size::Em(0.75)}
                    target="_blank"
                    label="Source"
                    type="faded"/>
                </Ui.Container>
              }
              title=<{ name }>/>
          </Ui.Card>
        }

      </Ui.Grid>
    </div>
  }
}
