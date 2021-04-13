component Documentation.AdaptingToScreenSize {
  fun render {
    <>
      <Ui.Box title=<{ "Adapting to screen size" }>>
        <p>
          "This document shows two methods of adapting your compone" \
          "nt to different screen sizes."
        </p>
      </Ui.Box>

      <DocBox
        title="Mobile vs Desktop"
        content=<{
          <p>
            "The easiest way to make sure that your component display" \
            "s well on desktop and mobile is to have different conten" \
            "t for each."
          </p>

          <p>
            "To achieve that you can connect to the "
            <code>"Ui"</code>
            " store and expose / use the "
            <code>"mobile"</code>
            " variable."
          </p>

          <p>
            "The value of the variable dynamically changes when the s" \
            "creen is resized."
          </p>
        }>
        example={
          try {
            code =
              [
                "component Main {",
                "  connect Ui exposing { mobile }",
                "",
                "  fun render : Html {",
                "    if (mobile) {",
                "      <div>\"MOBILE\"</div>",
                "    } else {",
                "      <div>\"DESKTOP\"</div>",
                "    }",
                "  }",
                "}"
              ]
              |> String.join("\n")

            <Hljs code={code}/>
          }
        }/>

      <DocBox
        title="Provider.ElementSize"
        content=<{
          <p>
            "The other way is to measure the size of the element and " \
            "use that to decide what to show"
          </p>

          <p>
            "To achieve that you can use the "
            <code>"Provider.ElementSize"</code>

            " provider which calls the given function when the observ" \
            "ed element is resized."
          </p>
        }>
        example={
          try {
            code =
              [
                "component Main {",
                "  state width : Number = 0",
                "",
                "  use Provider.ElementSize {",
                "   changes = updateWidth,",
                "   element = base",
                "  }",
                "",
                "  fun updateWidth (dimensions : Dom.Dimensions) {",
                "    next { width = dimensions.width }",
                "  }",
                "",
                "  fun render : Html {",
                "    <div as base>",
                "      if (width < 700) {",
                "        <div>\"MOBILE\"</div>",
                "      } else if (width < 1100) {",
                "        <div>\"TABLET\"</div>",
                "      } else {",
                "        <div>\"DESKTOP\"</div>",
                "      }",
                "    </div>",
                "  }",
                "}"
              ]
              |> String.join("\n")

            <Hljs code={code}/>
          }
        }/>
    </>
  }
}
