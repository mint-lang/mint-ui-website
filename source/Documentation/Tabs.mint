component Documentation.Tabs {
  fun render {
    <>
      <Ui.Box title=<{ "Tabs" }>>
        <p>
          "To render tabs you can use the "
          <code>"Ui.Tab"</code>
          " record."
        </p>
      </Ui.Box>

      <DocBox
        title="Ui.Tab"
        content=<{ "A tab consist of a label, icon (before or after), a key and content." }>
        example={
          <Example
            data={
              @format {
                <Ui.Tabs
                  active="campfire"
                  breakpoint={600}
                  items=[
                    {
                      content = <p>"This is the content for the campfire tab!"</p>,
                      iconBefore = Ui.Icons:FLAME,
                      iconAfter = <></>,
                      label = "Campfire",
                      key = "campfire"
                    },
                    {
                      content = <p>"This is the content for the code tab!"</p>,
                      iconBefore = Ui.Icons:CODE,
                      iconAfter = <></>,
                      label = "Code",
                      key = "code"
                    }
                  ]/>
              }
            }
            fullWidth={true}/>
        }/>
    </>
  }
}
