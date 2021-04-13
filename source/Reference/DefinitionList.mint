component Reference.DefinitionList {
  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.DefinitionList" }>>
        <p>"A definition list is the mobile equivalent of a table."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.DefinitionList"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            data={
              @format {
                <Ui.DefinitionList
                  headers=["First Name", "Last Name"]
                  rows=[
                    {
                      "John Doe", [
                        Ui.Cell::String("John"),
                        Ui.Cell::String("Doe")
                      ]
                    },
                    {
                      "Jane Doe", [
                        Ui.Cell::String("Jane"),
                        Ui.Cell::String("Doe")
                      ]
                    }
                  ]/>
              }
            }/>
        }/>

      <DocBox
        title="Headers"
        content={
          <p>
            "The "
            <code>"headers"</code>
            " property defines the labels for the cells."
          </p>
        }
        example={
          <Example
            data={
              @format {
                <Ui.DefinitionList
                  headers=["Cell 1 Label", "Cell 2 Label"]
                  rows=[
                    {
                      "Summary", [
                        Ui.Cell::String("Cell 1 Content"),
                        Ui.Cell::String("Cell 2 Content")
                      ]
                    }
                  ]/>
              }
            }/>
        }/>

      <DocBox
        title="Rows"
        content={
          <p>
            "The "
            <code>"rows"</code>
            " property defines the rows (of cells)."
          </p>
        }
        example={
          <Example
            data={
              @format {
                <Ui.DefinitionList
                  headers=["Cell 1 Label", "Cell 2 Label"]
                  rows=[
                    {
                      "Summary 1", [
                        Ui.Cell::String("Row 1 Cell 1"),
                        Ui.Cell::String("Row 1 Cell 2")
                      ]
                    },
                    {
                      "Summary 2", [
                        Ui.Cell::String("Row 2 Cell 1"),
                        Ui.Cell::String("Row 2 Cell 2")
                      ]
                    },
                    {
                      "Summary 3", [
                        Ui.Cell::String("Row 3 Cell 1"),
                        Ui.Cell::String("Row 3 Cell 2")
                      ]
                    }
                  ]/>
              }
            }/>
        }/>

      <DocBox
        title="Size"
        content={
          <p>
            "The size of the component can be set with the "

            <code>"size"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[20, 25, 30]
            data={
              @format {
                try {
                  rows =
                    [
                      {
                        "John Doe", [
                          Ui.Cell::String("John"),
                          Ui.Cell::String("Doe")
                        ]
                      },
                      {
                        "Jane Doe", [
                          Ui.Cell::String("Jane"),
                          Ui.Cell::String("Doe")
                        ]
                      }
                    ]

                  <>
                    <Ui.DefinitionList
                      headers=["First Name", "Last Name"]
                      size={Ui.Size::Px(12)}
                      rows={rows}/>

                    <Ui.DefinitionList
                      headers=["First Name", "Last Name"]
                      size={Ui.Size::Px(16)}
                      rows={rows}/>

                    <Ui.DefinitionList
                      headers=["First Name", "Last Name"]
                      size={Ui.Size::Px(20)}
                      rows={rows}/>
                  </>
                }
              }
            }/>
        }/>
    </>
  }
}
