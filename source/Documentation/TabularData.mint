component Documentation.TabularData {
  fun render {
    <>
      <Ui.Box title=<{ "Tabular Data" }>>
        <p>
          "In Mint to tabular data you can use a special data structure which used by "

          <a href="/components/ui-table">
            "Ui.Table"
          </a>

          " and "

          <a href="/components/ui-definition-list">
            "Ui.DefinitionList"
          </a>

          "."
        </p>
      </Ui.Box>

      <DocBox
        title="Example"
        content={
          <p>
            "Below you can see the available options for the "
            <code>"Ui.Cell"</code>
            " in a table."
          </p>
        }
        example={
          <Example
            fullWidth={true}
            data={
              @format {
                <Ui.Table
                  headers=[
                    {
                      sortKey = "string",
                      sortable = false,
                      label = "String",
                      shrink = false
                    },
                    {
                      sortKey = "html",
                      sortable = false,
                      label = "Html",
                      shrink = false
                    },
                    {
                      sortKey = "number",
                      sortable = false,
                      label = "Number",
                      shrink = true
                    },
                    {
                      sortKey = "code",
                      sortable = false,
                      label = "Code",
                      shrink = true
                    },
                    {
                      sortKey = "html-items",
                      label = "Html Items",
                      sortable = false,
                      shrink = true
                    }
                  ]
                  rows=[
                    {
                      "Summary of the row",
                      [
                        Ui.Cell::String("Some string!"),
                        Ui.Cell::Html(
                          <Ui.Button
                            size={Ui.Size::Em(0.75)}
                            label="A Button!"/>),
                        Ui.Cell::Number(124),
                        Ui.Cell::Code(code = "<div></div>", breakSpaces = false),
                        Ui.Cell::HtmlItems(
                          [
                            <Ui.Icon icon={Ui.Icons:PENCIL}/>,
                            <Ui.Icon icon={Ui.Icons:CLOUD_DOWNLOAD}/>
                          ])
                      ]
                    }
                  ]
                  breakpoint={600}/>
              }
            }/>
        }/>
    </>
  }
}
