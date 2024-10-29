component Reference.Table {
  state orderDirection : String = "desc"
  state orderBy : String = "name"
  state breakpoint : Number = 0
  state bordered : Bool = true
  state size : Number = 16

  get playgroundCode : String {
    "Ui.Table"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("bordered", bordered)
    |> ComponentBuilder.addString("orderDirection", orderDirection)
    |> ComponentBuilder.addString("orderBy", orderBy)
    |> ComponentBuilder.addNumber("breakpoint", breakpoint)
    |> ComponentBuilder.addRaw("headers", HEADERS[1])
    |> ComponentBuilder.addRaw("rows", ROWS[1])
    |> ComponentBuilder.toString()
  }

  const HEADERS =
    @format {
      [
        { sortKey: "name", sortable: true, label: "Name", shrink: true },
        { sortKey: "email", sortable: true, label: "Email", shrink: false },
        { sortKey: "active", sortable: false, label: "Active", shrink: true }
      ]
    }

  const ROWS =
    @format {
      [
        {
          "John Doe",
          [
            Ui.Cell.String("John Doe"),
            Ui.Cell.String("john.doe@example.com"),
            Ui.Cell.Code(code: "false", breakSpaces: false)
          ]
        },
        {
          "Jane Doe",
          [
            Ui.Cell.String("Jane Doe"),
            Ui.Cell.String("jane.doe@example.com"),
            Ui.Cell.Code(code: "true", breakSpaces: false)
          ]
        }
      ]
    }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Table"</>>
        <p>"A component to displayed tabluar data."</p>

        <ul>
          <li>
            "The table is fully controlled meaning that it's just a view and you need to do the sorting yourself."
          </li>

          <li>
            "The table collapses into a "

            <a href="/components/ui-definition-list">
              <code>"Ui.DefinitionList"</code>
            </a>

            " on mobile resultions (the breakpoint can be configured)."
          </li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.Table"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            fullWidth={true}
            controls=<>
              <Ui.Field label="Order Direction">
                <Ui.Native.Select
                  items={Ui.ListItem.fromStringArray(["asc", "desc"])}
                  onChange={-> orderDirection}
                  value={orderDirection}
                />
              </Ui.Field>

              <Ui.Field label="Order By">
                <Ui.Native.Select
                  items={Ui.ListItem.fromStringArray(["name", "email"])}
                  onChange={-> orderBy}
                  value={orderBy}
                />
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider onChange={-> size} value={size} max={100} min={0}/>
              </Ui.Field>

              <Ui.Field label="Breakpoint (#{breakpoint}px)">
                <Ui.Slider
                  onChange={-> breakpoint}
                  value={breakpoint}
                  max={1500}
                  min={0}
                />
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Bordered">
                <Ui.Checkbox onChange={-> bordered} checked={bordered}/>
              </Ui.Field>
            </>
            data={
              {
                <Ui.Table
                  orderDirection={orderDirection}
                  size={Ui.Size.Px(size)}
                  breakpoint={breakpoint}
                  headers={HEADERS[0]}
                  bordered={bordered}
                  orderBy={orderBy}
                  rows={ROWS[0]}
                />,
                playgroundCode
              }
            }
          />
        }
      />

      <DocBox
        title="Order Direction"
        content={
          <p>
            "The order direction of ordered column can be indicated with the "
            <code>"orderDescription"</code>
            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            data={
              @format {
                let rows =
                  [
                    {
                      "John Doe",
                      [
                        Ui.Cell.String("John Doe"),
                        Ui.Cell.String("john.doe@example.com")
                      ]
                    }
                  ]

                let headers =
                  [
                    { sortKey: "name", sortable: true, label: "Name", shrink:
                      true },
                    {
                      sortKey: "email",
                      sortable: true,
                      label: "Email",
                      shrink: false
                    }
                  ]

                <>
                  <Ui.Table
                    orderDirection="asc"
                    headers={headers}
                    breakpoint={0}
                    orderBy="name"
                    rows={rows}
                  />

                  <Ui.Table
                    orderDirection="desc"
                    headers={headers}
                    orderBy="name"
                    breakpoint={0}
                    rows={rows}
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Order By"
        content={
          <p>
            "Which column is the ordered one can be indicated with the "
            <code>"orderBy"</code>
            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            data={
              @format {
                let rows =
                  [
                    {
                      "John Doe",
                      [
                        Ui.Cell.String("John Doe"),
                        Ui.Cell.String("john.doe@example.com")
                      ]
                    }
                  ]

                let headers =
                  [
                    { sortKey: "name", sortable: true, label: "Name", shrink:
                      true },
                    {
                      sortKey: "email",
                      sortable: true,
                      label: "Email",
                      shrink: false
                    }
                  ]

                <>
                  <Ui.Table
                    headers={headers}
                    breakpoint={0}
                    orderBy="name"
                    rows={rows}
                  />

                  <Ui.Table
                    headers={headers}
                    orderBy="email"
                    breakpoint={0}
                    rows={rows}
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Order Change"
        content={
          <p>
            "The "
            <code>"onOrderChange"</code>
            " property is called when the user request a change in ordering."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            data={
              @format {
                <Ui.Table
                  onOrderChange={
                    (data : Tuple(String, String)) {
                      let {column, direction} =
                        data

                      Ui.Notifications.notifyDefault(
                        <>
                          "Order change to: "
                          <b>"#{column}/#{direction}"</b>
                        </>)
                    }
                  }
                  breakpoint={0}
                  headers=[
                    { sortKey: "name", sortable: true, label: "Name", shrink:
                      true },
                    {
                      sortKey: "email",
                      sortable: true,
                      label: "Email",
                      shrink: false
                    }
                  ]
                  rows=[
                    {
                      "John Doe",
                      [
                        Ui.Cell.String("John Doe"),
                        Ui.Cell.String("john.doe@example.com")
                      ]
                    }
                  ]
                />
              }
            }
          />
        }
      />

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
            verticalSpacing={20}
            data={
              @format {
                let rows =
                  [
                    {
                      "John Doe",
                      [
                        Ui.Cell.String("John Doe"),
                        Ui.Cell.String("john.doe@example.com")
                      ]
                    }
                  ]

                let headers =
                  [
                    { sortKey: "name", sortable: true, label: "Name", shrink:
                      true },
                    {
                      sortKey: "email",
                      sortable: true,
                      label: "Email",
                      shrink: false
                    }
                  ]

                <>
                  <Ui.Table
                    size={Ui.Size.Px(12)}
                    headers={headers}
                    breakpoint={0}
                    rows={rows}
                  />

                  <Ui.Table
                    size={Ui.Size.Px(16)}
                    headers={headers}
                    breakpoint={0}
                    rows={rows}
                  />

                  <Ui.Table
                    size={Ui.Size.Px(20)}
                    headers={headers}
                    breakpoint={0}
                    rows={rows}
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Breakpoint"
        content={
          <p>
            "The breakpoint which determines to show a "

            <a href="/components/ui-definition-list">
              <code>"Ui.DefinitionList"</code>
            </a>

            " instead can be set using the "
            <code>"breakpoint"</code>
            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            data={
              @format {
                let rows =
                  [
                    {
                      "John Doe",
                      [
                        Ui.Cell.String("John Doe"),
                        Ui.Cell.String("john.doe@example.com")
                      ]
                    }
                  ]

                let headers =
                  [
                    { sortKey: "name", sortable: true, label: "Name", shrink:
                      true },
                    {
                      sortKey: "email",
                      sortable: true,
                      label: "Email",
                      shrink: false
                    }
                  ]

                <>
                  <Ui.Table headers={headers} breakpoint={500} rows={rows}/>

                  <Ui.Table headers={headers} breakpoint={0} rows={rows}/>
                </>
              }
            }
          />
        }
      />
    </>
  }
}
