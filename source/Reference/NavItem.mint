component Reference.NavItem {
  state size : Number = 16

  const ITEM =
    @format {
      Ui.NavItem::Link(
        iconBefore: Ui.Icons:HOME,
        iconAfter: <></>,
        label: "Home",
        target: "",
        href: "/")
    }

  get playgroundCode : String {
    "Ui.NavItem"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addExpression("item", ITEM[1])
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.NavItem" }>>
        <p>
          "A component to display a "

          <a href="/documentation/navigation">
            "navigation item."
          </a>
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.NavItem"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size: value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.NavItem
                  size={Ui.Size::Px(size)}
                  item={ITEM[0]}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Item"
        content={
          <p>
            "The item to display can be set with the "

            <code>"item"</code>

            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            data={
              @format {
                <>
                  <Ui.NavItem
                    item={
                      Ui.NavItem::Link(
                        iconBefore: Ui.Icons:HOME,
                        iconAfter: <></>,
                        label: "Home",
                        target: "",
                        href: "/")
                    }/>

                  <Ui.NavItem
                    item={
                      Ui.NavItem::Item(
                        iconBefore: Ui.Icons:BROADCAST,
                        label: "Click Me!",
                        iconAfter: <></>,
                        action:
                          (event : Html.Event) {
                            Ui.Notifications.notifyDefault(<{ "Clicked!" }>)
                          })
                    }/>

                  <Ui.NavItem item={Ui.NavItem::Divider}/>

                  <Ui.NavItem
                    item={
                      Ui.NavItem::Group(
                        iconBefore: Ui.Icons:FILE_DIRECTORY,
                        iconAfter: <></>,
                        label: "Files",
                        items:
                          [
                            Ui.NavItem::Item(
                              iconBefore: Ui.Icons:FILE_CODE,
                              action: Promise.never1,
                              label: "Main.mint",
                              iconAfter: <></>),
                            Ui.NavItem::Item(
                              iconBefore: Ui.Icons:FILE_MEDIA,
                              action: Promise.never1,
                              label: "Logo.svg",
                              iconAfter: <></>)
                          ])
                    }/>
                </>
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
            highlight=[2, 13, 24]
            data={
              @format {
                <>
                  <Ui.NavItem
                    size={Ui.Size::Px(12)}
                    item={
                      Ui.NavItem::Link(
                        iconBefore: Ui.Icons:HOME,
                        iconAfter: <></>,
                        label: "Home",
                        target: "",
                        href: "/")
                    }/>

                  <Ui.NavItem
                    size={Ui.Size::Px(16)}
                    item={
                      Ui.NavItem::Link(
                        iconBefore: Ui.Icons:HOME,
                        iconAfter: <></>,
                        label: "Home",
                        target: "",
                        href: "/")
                    }/>

                  <Ui.NavItem
                    size={Ui.Size::Px(20)}
                    item={
                      Ui.NavItem::Link(
                        iconBefore: Ui.Icons:HOME,
                        iconAfter: <></>,
                        label: "Home",
                        target: "",
                        href: "/")
                    }/>
                </>
              }
            }/>
        }/>
    </>
  }
}
