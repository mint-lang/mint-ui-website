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
        content={
          <<#MARKDOWN
          The easiest way to make sure that your component displays well on
          desktop and mobile is to have different content for each. To achieve
          that you can connect to the `Ui` store and expose / use the `mobile`
          variable.

          The value of the variable dynamically changes when the screen is
          resized.
          MARKDOWN
        }
        example={
          <Hljs
            code={
              <<~MINT
              component Main {
                connect Ui exposing { mobile }

                fun render : Html {
                  if (mobile) {
                    <div>"MOBILE"</div>
                  } else {
                    <div>"DESKTOP"</div>
                  }
                }
              }
              MINT
            }/>
        }/>

      <DocBox
        title="Provider.ElementSize"
        content={
          <<#MARKDOWN
            The other way is to measure the size of the element and use that to
            decide what to show.

            To achieve that you can use the `Provider.ElementSize` provider
            which calls the given function when the observed element is resized.
          MARKDOWN
        }
        example={
          <Hljs
            code={
              <<~MINT
            component Main {
              state width : Number = 0

              use Provider.ElementSize {
               changes: updateWidth,
               element: base
              }

              fun updateWidth (dimensions : Dom.Dimensions) {
                next { width: dimensions.width }
              }

              fun render : Html {
                <div as base>
                  if (width < 700) {
                    <div>"MOBILE"</div>
                  } else if (width < 1100) {
                    <div>"TABLET"</div>
                  } else {
                    <div>"DESKTOP"</div>
                  }
                </div>
              }
            }
            MINT
            }/>
        }/>
    </>
  }
}
