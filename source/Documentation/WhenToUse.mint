component Documentation.WhenToUse {
  fun render {
    <>
      <Ui.Box title=<{ "When to use" }>>
        <p>
          "Mint UI is not suitable for every use case on the web, t" \
          "his document should give a good idea when to use it."
        </p>

        <p>"In general use Mint UI if:"</p>

        <ul>
          <li>
            "You are comfortable using the "

            <a
              href="https://www.mint-lang.com"
              target="_blank">

              "Mint programming language."

            </a>
          </li>

          <li>"You are comfortable with the visual style of the components."</li>
          <li>"You are comfortable using components and HTML like syntax."</li>
          <li>"You like to build from a component library."</li>
          <li>"You like fast development cycle."</li>
          <li>"You don't need SSR (server side rendering)."</li>
          <li>"You don't need code splitting."</li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Use Cases"
        content=<{
          <p>"Mint UI should be ideal for the following type of projects:"</p>

          <ul>
            <li>"Desktop applications that use web technologies."</li>
            <li>"Mobile applications that use web technologies."</li>
            <li>"Admin interfaces - like forms and dashboards."</li>
            <li>"PWAs of any size."</li>
            <li>"In-house tools."</li>
            <li>"Hobby projects."</li>
          </ul>
        }>/>
    </>
  }
}
