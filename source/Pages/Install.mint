component Pages.Install {
  fun render : Html {
    <>
      <Ui.Box title=<{ "Install" }>>
        <p>
          "This guide assumes that you already have Mint installed. If not, check out the "

          <a
            href="https://www.mint-lang.com/install"
            target="_blank">

            "Mint installation methods"

          </a>

          " and come back when you’re done."
        </p>
      </Ui.Box>

      <DocBox
        title="Installing Mint UI"
        content=<{
          <p>"First you need to create your application:"</p>

          <pre>
            <code>"mint init your-application\ncd your-application"</code>
          </pre>

          <p>
            "Then add "
            <b>"mint-ui"</b>
            " to the "
            <code>"mint.json"</code>
            " file as a dependency."
          </p>

          <pre>
            <code>
              try {
                [
                  "\"dependencies\": {",
                  "  \"mint-ui\": {",
                  "    \"repository\": \"https://github.com/mint-lang/mint-ui\",",
                  "    \"constraint\": \"1.0.0 <= v < 2.0.0\"",
                  "  }",
                  "}"
                ]
                |> String.join("\n")
              }
            </code>
          </pre>

          <p>
            "Finally run "
            <code>"mint install"</code>
            "to get the dependencies:"
          </p>

          <pre>
            <code>"mint install"</code>
          </pre>

          <p>"You should see something like this:"</p>

          <pre>
            <code>
              try {
                [
                  "Mint - Installing dependencies",
                  "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                  "⚙ Constructing dependency tree...",
                  "  ✔ Cloned mint-ui(https://github.com/mint-lang/mint-ui)",
                  "  ✔ Cloned mint-color(https://github.com/mint-lang/mint-color)",
                  "",
                  "⚙ Resolving dependency tree...",
                  "  ◈ mint-ui ➔ 1.0.0",
                  "  ◈ mint-color ➔ 1.0.0",
                  "",
                  "⚙ Copying packages...",
                  "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                  "All done in 2.387s!"
                ]
                |> String.join("\n")
              }
            </code>
          </pre>

          <p>"That’s it! You’re now ready to use Mint UI in your application."</p>
        }>/>
    </>
  }
}
