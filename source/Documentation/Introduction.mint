component Documentation.Introduction {
  fun render {
    <>
      <Ui.Box title=<{ "Introduction" }>>
        <p>
          "Mint UI is a "

          <a
            href="https://en.wikipedia.org/wiki/Design_system"
            target="_blank">

            "design system"

          </a>

          " and "

          <a href="/components">
            "component library"
          </a>

          " for building websites and web applications which work w" \
          "ell on all screen sizes (desktop and mobile devices, min" \
          "imum 320px wide)."
        </p>
      </Ui.Box>

      <DocBox
        title="Principles"
        content=<{
          <p>"Mint UI is following these principles:"</p>

          <ul>
            <li>
              <strong>"Form follows function"</strong>
              " - The function of the UI defines its looks and not the other way around."
            </li>

            <li>
              <strong>"Consistent"</strong>
              " - The UI is consistent across screen sizes and applications."
            </li>

            <li>
              <strong>"Composable"</strong>

              " - A component (smallest building block) is used to buil" \
              "d other components, UIs and applications using compositi" \
              "on."
            </li>

            <li>
              <strong>"Adaptive"</strong>
              " - The UI adapts to screen size fully not just by rearranging the contents."
            </li>

            <li>
              <strong>"Extensible"</strong>
              " - It will always possible to create components for Mint UI that fit its design."
            </li>

            <li>
              <strong>"Build to last"</strong>
              " - Neither the components themselves or the design will change drasticly in the decades to come."
            </li>

            <li>
              <strong>"Data first"</strong>
              " - The UI adapts to the screen size based on data."
            </li>

            <li>
              <strong>"Free"</strong>
              " - Mint UI is and always will be free for individuals and small companies."
            </li>
          </ul>
        }>/>

      <DocBox
        title="Features"
        content=<{
          <p>"In addition to the principles above, Mint UI has to following features:"</p>

          <ul>
            <li>
              <strong>"Themeable"</strong>
              " - All componens are themeable using CSS variables."
            </li>

            <li>
              <strong>"PWA ready"</strong>
              " - Mint and Mint UI has a lot functinonalities for developing "

              <a
                href="https://en.wikipedia.org/wiki/Progressive_web_application"
                target="_blank">

                "Progressive Web Applications"

              </a>

              "."
            </li>

            <li>
              <strong>"Web forever"</strong>
              " - Mint UI will not compile to any other target then the Web (iOs, Android, etc...)."
            </li>
          </ul>
        }>/>
    </>
  }
}
