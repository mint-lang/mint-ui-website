component Documentation.DarkLightMode {
  fun render {
    <>
      <Ui.Box title=<{ "Dark / Light mode" }>>
        <p>
          "Mint UI supports dark and light modes like "

          <a
            href="https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme"
            target="_blank">

            "CSS does"

          </a>

          "."
        </p>

        <ul>
          <li>"The preference of the user is respected until they change it directly."</li>

          <li>
            "The current mode is saved in "

            <a
              href="https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API"
              target="_blank">

              "LocalStorage"

            </a>

            "."
          </li>

          <li>"The mode can be changed for the whole application only."</li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Getting the current mode"
        content=<{
          <p>
            "You can get the current mode by connecting your component to the "
            <code>"Ui"</code>
            " store and exposing the "
            <code>"darkMode"</code>
            " variable."
          </p>
        }>
        example={<Hljs code="connect Ui exposing { darkMode }"/>}/>

      <DocBox
        title="Setting the mode"
        content=<{
          <p>
            "The mode can be set using the "
            <code>"Ui.setDarkMode"</code>
            " function."
          </p>
        }>
        example={
          <Example
            data={
              @format {
                <Ui.Button
                  onClick={(event : Html.Event) { Ui.setDarkMode(!Ui.darkMode) }}
                  label="Toggle"/>
              }
            }/>
        }/>

      <DocBox
        title="Ui.DarkModeToggle"
        content=<{
          <p>
            "There is a component for toggling dark / light modes: "

            <a href="/components/ui-darkmodetoggle">
              "Ui.DarkModeToggle"
            </a>
          </p>
        }>
        example={
          <Example
            data={
              @format {
                <Ui.DarkModeToggle/>
              }
            }/>
        }/>
    </>
  }
}
