component Reference.NavItems {
  state size : Number = 16

  const ITEMS =
    @format {
      [
        Ui.NavItem::Link(
          iconBefore = Ui.Icons:HOME,
          iconAfter = <></>,
          label = "Home",
          target = "",
          href = "/"),
        Ui.NavItem::Item(
          iconBefore = Ui.Icons:BROADCAST,
          label = "Click Me!",
          iconAfter = <></>,
          action =
            (event : Html.Event) {
              Ui.Notifications.notifyDefault(<{ "Clicked!" }>)
            }),
        Ui.NavItem::Divider,
        Ui.NavItem::Group(
          iconBefore = Ui.Icons:FILE_DIRECTORY,
          iconAfter = <></>,
          label = "Files",
          items =
            [
              Ui.NavItem::Item(
                iconBefore = Ui.Icons:FILE_CODE,
                action = Promise.never1,
                label = "Main.mint",
                iconAfter = <></>),
              Ui.NavItem::Item(
                iconBefore = Ui.Icons:FILE_CODE,
                action = Promise.never1,
                label = "Header.mint",
                iconAfter = <></>),
              Ui.NavItem::Item(
                iconBefore = Ui.Icons:FILE_CODE,
                action = Promise.never1,
                label = "Footer.mint",
                iconAfter = <></>),
              Ui.NavItem::Item(
                iconBefore = Ui.Icons:FILE_MEDIA,
                action = Promise.never1,
                label = "Logo.svg",
                iconAfter = <></>)
            ])
      ]
    }

  get playgroundCode : String {
    "Ui.NavItems"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addRaw("items", ITEMS[1])
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.NavItems" }>>
        <p>
          "Display "

          <a href="/documentation/navigation-item">
            "navigation items"
          </a>

          " vertically in a tree like structure."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.NavItems"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size = value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.NavItems
                  size={Ui.Size::Px(size)}
                  items={ITEMS[0]}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Items"
        content={
          <p>
            "The items to display can be set with the "

            <code>"items"</code>

            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            data={
              @format {
                <>
                  <Ui.NavItems
                    items=[
                      Ui.NavItem::Group(
                        iconBefore = Ui.Icons:FILE_DIRECTORY,
                        iconAfter = <></>,
                        label = "Files",
                        items =
                          [
                            Ui.NavItem::Item(
                              iconBefore = Ui.Icons:FILE_CODE,
                              action = Promise.never1,
                              label = "Main.mint",
                              iconAfter = <></>),
                            Ui.NavItem::Item(
                              iconBefore = Ui.Icons:FILE_MEDIA,
                              action = Promise.never1,
                              label = "Logo.svg",
                              iconAfter = <></>)
                          ])
                    ]/>
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
            highlight=[2, 20, 38]
            data={
              @format {
                <>
                  <Ui.NavItems
                    size={Ui.Size::Px(12)}
                    items=[
                      Ui.NavItem::Link(
                        iconBefore = Ui.Icons:HOME,
                        iconAfter = <></>,
                        label = "Home",
                        href = "/",
                        target = ""),
                      Ui.NavItem::Divider,
                      Ui.NavItem::Link(
                        iconBefore = Ui.Icons:TELESCOPE,
                        iconAfter = <></>,
                        label = "Explore",
                        href = "/",
                        target = "")
                    ]/>

                  <Ui.NavItems
                    size={Ui.Size::Px(16)}
                    items=[
                      Ui.NavItem::Link(
                        iconBefore = Ui.Icons:HOME,
                        iconAfter = <></>,
                        label = "Home",
                        target = "",
                        href = "/"),
                      Ui.NavItem::Divider,
                      Ui.NavItem::Link(
                        iconBefore = Ui.Icons:TELESCOPE,
                        iconAfter = <></>,
                        label = "Explore",
                        target = "",
                        href = "/")
                    ]/>

                  <Ui.NavItems
                    size={Ui.Size::Px(20)}
                    items=[
                      Ui.NavItem::Link(
                        iconBefore = Ui.Icons:HOME,
                        iconAfter = <></>,
                        label = "Home",
                        target = "",
                        href = "/"),
                      Ui.NavItem::Divider,
                      Ui.NavItem::Link(
                        iconBefore = Ui.Icons:TELESCOPE,
                        iconAfter = <></>,
                        label = "Explore",
                        target = "",
                        href = "/")
                    ]/>
                </>
              }
            }/>
        }/>
    </>
  }
}
