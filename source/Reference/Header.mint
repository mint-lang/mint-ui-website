component Reference.Header {
  connect ListItems exposing { TYPES, ICON_ITEMS, getIcon }

  state icon : String = "THREE_BARS"
  state brand : String = "Brand"
  state breakpoint : Number = 0
  state size : Number = 16

  get playgroundCode : String {
    try {
      {items, code} =
        navitems

      "Ui.Header"
      |> ComponentBuilder.new()
      |> ComponentBuilder.addExpression("icon", "Ui.Icons:#{icon}")
      |> ComponentBuilder.addSizePx("size", size)
      |> ComponentBuilder.addStringHtml("brand", brand)
      |> ComponentBuilder.addNumber("breakpoint", breakpoint)
      |> ComponentBuilder.addExpression("items", code)
      |> ComponentBuilder.toString()
    }
  }

  get navitems {
    @format {
      [
        Ui.NavItem::Link(
          iconBefore = Ui.Icons:HOME,
          iconAfter = <{  }>,
          label = "Home",
          target = "",
          href = "/"),
        Ui.NavItem::Divider,
        Ui.NavItem::Link(
          iconBefore = Ui.Icons:BEAKER,
          label = "Laboratory",
          iconAfter = <{  }>,
          target = "",
          href = "/")
      ]
    }
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Header" }>>
        <p>"A component for displaying navigation items for websites and applications."</p>

        <p>
          "On mobile resolution the navigation collapses into an ic" \
          "on which tapped  opens an action sheet with the navigati" \
          "on items."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Header"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            fullWidth={true}
            controls=<{
              <Ui.Field label="Brand">
                <Ui.Input
                  onChange={(value : String) { next { brand = value } }}
                  value={brand}/>
              </Ui.Field>

              <Ui.Field label="Icon">
                <Ui.Native.Select
                  onChange={(value : String) { next { icon = value } }}
                  items={ICON_ITEMS}
                  value={icon}/>
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size = value } }}
                  value={size}
                  max={200}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Breakpoint (#{breakpoint}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { breakpoint = value } }}
                  value={breakpoint}
                  max={1000}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                try {
                  {items, code} =
                    navitems

                  <Ui.Header
                    size={Ui.Size::Px(size)}
                    breakpoint={breakpoint}
                    icon={getIcon(icon)}
                    brand=<{ brand }>
                    items={items}/>
                },
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Brand"
        content={
          <p>
            "The brand content can be set using the "
            <code>"brand"</code>
            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            fullWidth={true}
            data={
              @format {
                <>
                  <Ui.Header brand=<{ "Brand" }>/>
                  <Ui.Header brand=<{ <Ui.Button label="I am a Button!"/> }>/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Items"
        content={
          <p>
            "The provided items specified by the "
            <code>"items"</code>
            " property show up on the right side of the header. "
          </p>
        }
        example={
          <Example
            fullWidth={true}
            data={
              @format {
                <Ui.Header
                  brand=<{ brand }>
                  breakpoint={0}
                  items=[
                    Ui.NavItem::Link(
                      iconBefore = Ui.Icons:HOME,
                      iconAfter = <{  }>,
                      label = "Home",
                      target = "",
                      href = "/"),
                    Ui.NavItem::Divider,
                    Ui.NavItem::Group(
                      iconBefore = Ui.Icons:CHEVRON_DOWN,
                      iconAfter = <{  }>,
                      label = "Actions",
                      items =
                        [
                          Ui.NavItem::Link(
                            iconBefore = Ui.Icons:KEY,
                            iconAfter = <{  }>,
                            label = "Sign Up",
                            target = "",
                            href = "/"),
                          Ui.NavItem::Link(
                            iconBefore = Ui.Icons:SIGN_IN,
                            iconAfter = <{  }>,
                            label = "Sign in",
                            target = "",
                            href = "/")
                        ])
                  ]/>
              }
            }/>
        }/>

      <DocBox
        title="Icon"
        content={
          <p>
            "The icon to display on mobile resultions (which opens the action sheet) can be set using the "
            <code>"icon"</code>
            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            breakpoint={10000}
            highlight=[2, 13]
            fullWidth={true}
            data={
              @format {
                <>
                  <Ui.Header
                    icon={Ui.Icons:TASKLIST}
                    brand=<{ "Brand" }>
                    items=[
                      Ui.NavItem::Link(
                        iconBefore = Ui.Icons:HOME,
                        iconAfter = <{  }>,
                        label = "Home",
                        target = "",
                        href = "/")
                    ]/>

                  <Ui.Header
                    icon={Ui.Icons:TERMINAL}
                    brand=<{ "Brand" }>
                    items=[
                      Ui.NavItem::Link(
                        iconBefore = Ui.Icons:HOME,
                        iconAfter = <{  }>,
                        label = "Home",
                        target = "",
                        href = "/")
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
            highlight=[2, 14, 26]
            verticalSpacing={20}
            fullWidth={true}
            breakpoint={0}
            data={
              @format {
                <>
                  <Ui.Header
                    size={Ui.Size::Px(12)}
                    brand=<{ "Brand" }>
                    items=[
                      Ui.NavItem::Link(
                        iconBefore = Ui.Icons:HOME,
                        iconAfter = <{  }>,
                        label = "Home",
                        target = "",
                        href = "/")
                    ]/>

                  <Ui.Header
                    size={Ui.Size::Px(16)}
                    brand=<{ "Brand" }>
                    items=[
                      Ui.NavItem::Link(
                        iconBefore = Ui.Icons:HOME,
                        iconAfter = <{  }>,
                        label = "Home",
                        target = "",
                        href = "/")
                    ]/>

                  <Ui.Header
                    size={Ui.Size::Px(20)}
                    brand=<{ "Brand" }>
                    items=[
                      Ui.NavItem::Link(
                        iconBefore = Ui.Icons:HOME,
                        iconAfter = <{  }>,
                        label = "Home",
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
