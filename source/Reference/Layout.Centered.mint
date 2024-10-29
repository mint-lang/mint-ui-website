component Reference.Layout.Centered {
  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Layout.Centered"</>>
        <p>"A padded layout to display full page centered content."</p>

        <p>
          "Usually it's used to display registration or sign in pages and " \
          "it can be used with conjustion with "

          <a href="/components/ui-layout-website">"Ui.Layout.Website"</a>
          "."
        </p>
      </Ui.Box>

      <DocBox
        title="Demo"
        content={
          <p>
            "You can see a demo of a "
            <code>"Ui.Layout.Centered"</code>
            " below."
          </p>
        }
        example={
          <Example
            data={
              @format {
                <Ui.Layout.Centered><Ui.Button label="I am centered!"/></Ui.Layout.Centered>
              }
            }
          />
        }
      />

      <DocBox
        title="Maximum Content Width"
        content={
          <p>
            "The with of the children can be set with the "
            <code>"maxContentWidth"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Layout.Centered maxContentWidth="100px">
                    <Ui.Button label="I am centered!"/>
                  </Ui.Layout.Centered>
                </>
              }
            }
          />
        }
      />
    </>
  }
}
