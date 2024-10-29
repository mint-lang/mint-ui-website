component Reference.Breadcrumbs {
  state separator = "/"
  state size = 16

  const ITEMS =
    @format {
      [
        {"/", <>"Home"</>},
        {"/components", <>"Components"</>},
        {"", <>"Ui.BreadCrumbs"</>}
      ]
    }

  get playgroundCode : String {
    "Ui.Breadcrumbs"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addRaw("separator", "<{ \"#{separator}\" }>")
    |> ComponentBuilder.addRaw("items", ITEMS[1])
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Breadcrumbs"</>>
        <p>
          "Indicate the current page’s location within a navigational " \
          "hierarchy that automatically adds separators."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.Breadcrumbs"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider onChange={-> size} value={size} max={100} min={0}/>
              </Ui.Field>

              <Ui.Field label="Separator">
                <Ui.Input onChange={-> separator} value={separator}/>
              </Ui.Field>
            </>
            data={
              {
                <Ui.Breadcrumbs
                  separator=<>separator</>
                  size={Ui.Size.Px(size)}
                  items={ITEMS[0]}
                />,
                playgroundCode
              }
            }
          />
        }
      />

      <DocBox
        title="Separator"
        content={
          <p>
            "The separator can be changed using the "
            <code>"separator"</code>
            " property."
          </p>
        }
        example={
          <Example
            data={
              @format {
                <Ui.Breadcrumbs
                  separator=<>"»"</>
                  items=[
                    {"/", <>"Home"</>},
                    {"/components", <>"Components"</>},
                    {"", <>"Ui.Breadcrumbs"</>}
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
                <>
                  <Ui.Breadcrumbs
                    size={Ui.Size.Px(12)}
                    items=[
                      {"/", <>"Home"</>},
                      {"/components", <>"Components"</>}
                    ]
                  />

                  <Ui.Breadcrumbs
                    size={Ui.Size.Px(16)}
                    items=[
                      {"/", <>"Home"</>},
                      {"/components", <>"Components"</>}
                    ]
                  />

                  <Ui.Breadcrumbs
                    size={Ui.Size.Px(20)}
                    items=[
                      {"/", <>"Home"</>},
                      {"/components", <>"Components"</>}
                    ]
                  />
                </>
              }
            }
          />
        }
      />
    </>
  }
}
