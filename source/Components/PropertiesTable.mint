component PropertiesTable {
  property documentation : Object

  style description {
    :first-child {
      margin-top: 0;
    }

    :last-child {
      margin-bottom: 0;
    }
  }

  style name {
    white-space: nowrap;
    font-weight: bold;
  }

  fun render : Html {
    case (decode documentation as Documentation) {
      Result::Ok(decoded) =>
        if (Array.isEmpty(decoded.properties)) {
          <></>
        } else {
          let sorted =
            Array.sortBy(
              decoded.properties,
              (item : Documentation.Property) {
                item.name
              })

          let rows =
            for (prop of sorted) {
              {
                prop.name, [
                  Ui.Cell::Html(
                    <div::name>
                      <{ prop.name }>
                    </div>),
                  case (prop.description) {
                    Maybe::Just(value) =>
                      Ui.Cell::Html(
                        <div::description>
                          <Ui.Html
                            content={
                              value
                            }/>
                        </div>)

                    Maybe::Nothing => Ui.Cell::String("")
                  },
                  case (prop.type) {
                    Maybe::Just(value) =>
                      Ui.Cell::Code(code: value, breakSpaces: true)

                    Maybe::Nothing => Ui.Cell::String("")
                  },
                  case (prop.default) {
                    Maybe::Just(value) => Ui.Cell::Code(code: value, breakSpaces: false)
                    Maybe::Nothing => Ui.Cell::String("")
                  }
                ]
              }
            }

          <Ui.Box
            title={
              <a name="properties">
                "Properties"
              </a>
            }>

            <p>"These are all the properties of the component:"</p>

            <Ui.Table
              breakpoint={
                700
              }
              headers=[
                {
                  sortKey: "name",
                  sortable: false,
                  label: "Name",
                  shrink: false
                },
                {
                  sortKey: "description",
                  sortable: false,
                  label: "Description",
                  shrink: false
                },
                {
                  sortKey: "type",
                  sortable: false,
                  label: "Type",
                  shrink: true
                },
                {
                  sortKey: "name",
                  sortable: false,
                  label: "Default Value",
                  shrink: true
                }
              ]
              rows={
                rows
              }/>

          </Ui.Box>
        }

      => <></>
    }
  }
}
