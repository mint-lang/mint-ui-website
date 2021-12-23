component Pages.Cell {
  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Cell" }>>
        <p>
          "This is a component to render the "

          <code>"Ui.Cell"</code>

          " enum."
          <br/>
          "It is used to render data in tables and definition lists."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={<p>"You can check out how the different cases render below:"</p>}
        example={
          <Example
            data={
              @format {
                <>
                  <Ui.Cell cell={Ui.Cell::Code(code = "<div></div>", breakSpaces = false)}/>
                  <Ui.Cell cell={Ui.Cell::Html(<{ "Hello!" }>)}/>
                  <Ui.Cell cell={Ui.Cell::String("Hello!")}/>
                  <Ui.Cell cell={Ui.Cell::Number(0)}/>

                  <Ui.Cell
                    cell={
                      Ui.Cell::HtmlItems(
                        breakOnMobile = true,
                        items =
                          [
                            <Ui.Icon icon={Ui.Icons:PENCIL}/>,
                            <Ui.Icon icon={Ui.Icons:TRASHCAN}/>,
                            <Ui.Icon icon={Ui.Icons:DESKTOP_DOWNLOAD}/>
                          ])
                    }/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Content"
        content={
          <p>
            "The cell itself can be set with the "

            <code>"cell"</code>

            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={10}
            data={
              @format {
                <>
                  <Ui.Cell cell={Ui.Cell::Code(code = "<div></div>", breakSpaces = false)}/>
                  <Ui.Cell cell={Ui.Cell::Html(<{ "Hello!" }>)}/>
                  <Ui.Cell cell={Ui.Cell::String("Hello!")}/>
                  <Ui.Cell cell={Ui.Cell::Number(0)}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Size"
        content={
          <p>
            "The size of a cell can be set with the "

            <code>"size"</code>

            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={10}
            highlight=[3, 7, 11]
            data={
              @format {
                <>
                  <Ui.Cell
                    cell={Ui.Cell::String("String value!")}
                    size={Ui.Size::Px(12)}/>

                  <Ui.Cell
                    cell={Ui.Cell::String("String value!")}
                    size={Ui.Size::Px(16)}/>

                  <Ui.Cell
                    cell={Ui.Cell::String("String value!")}
                    size={Ui.Size::Px(20)}/>
                </>
              }
            }/>
        }/>
    </>
  }
}
