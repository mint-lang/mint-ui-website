component Documentation.WhenNotToUse {
  fun render {
    <>
      <Ui.Box title=<{ "When not to use" }>>
        <p>
          "Mint UI is not suitable for every use case on the web, t" \
          "his document should give a good idea which are those."
        </p>

        <p>
          "In general "
          <strong>"don't use"</strong>
          " Mint UI if:"
        </p>

        <ul>
          <li>
            "You want to use any other programming language then "

            <a
              href="https://www.mint-lang.com"
              target="_blank">

              "Mint"

            </a>

            "."
          </li>

          <li>"You don't like the visual style of the components."</li>
          <li>"You don't like the HTML like syntax."</li>
          <li>"You like to build from things from scratch."</li>
          <li>"You need SSR (server side rendering)."</li>
          <li>"You need code splitting."</li>
          <li>"You want to use NPM."</li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Not Use Cases"
        content=<{
          <p>"Don't use Mint UI if you want to build:"</p>

          <ul>
            <li>"SEO heavy websites."</li>
            <li>"Static websites (like blogs)."</li>
            <li>"Native mobile applications."</li>
          </ul>
        }>/>
    </>
  }
}
