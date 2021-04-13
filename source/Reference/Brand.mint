component Reference.Brand {
  connect ListItems exposing { ICON_ITEMS, getIcon }

  state icon : String = "MINT"
  state name : String = "Mint"
  state href : String = ""
  state size : Number = 16

  get playgroundCode : String {
    "Ui.Brand"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addExpression("icon", "Ui.Icons:#{icon}")
    |> ComponentBuilder.addString("name", name)
    |> ComponentBuilder.addString("href", href)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Brand" }>>
        <p>"A component to display an icon and name together as a brand."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Brand"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Name">
                <Ui.Input
                  onChange={(value : String) { next { name = value } }}
                  value={name}/>
              </Ui.Field>

              <Ui.Field label="Icon">
                <Ui.Native.Select
                  onChange={(value : String) { next { icon = value } }}
                  items={ICON_ITEMS}
                  value={icon}/>
              </Ui.Field>

              <Ui.Field label="Href">
                <Ui.Input
                  onChange={(value : String) { next { href = value } }}
                  value={href}/>
              </Ui.Field>

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
                <Ui.Brand
                  size={Ui.Size::Px(size)}
                  icon={getIcon(icon)}
                  name={name}
                  href={href}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Name"
        content={
          <p>
            "The name displayed can be set with the "

            <code>"name"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[3, 7, 11]
            data={
              @format {
                <>
                  <Ui.Brand
                    icon={Ui.Icons:FLAME}
                    name="Mint"/>

                  <Ui.Brand
                    icon={Ui.Icons:BEAKER}
                    name="Mint Labs"/>

                  <Ui.Brand
                    icon={Ui.Icons:CART}
                    name="Mint Shop"/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Icon"
        content={
          <p>
            "The icon displayed can be set with the "

            <code>"icon"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[2, 6, 10]
            data={
              @format {
                <>
                  <Ui.Brand
                    icon={Ui.Icons:FLAME}
                    name="Mint"/>

                  <Ui.Brand
                    icon={Ui.Icons:BEAKER}
                    name="Mint Labs"/>

                  <Ui.Brand
                    icon={Ui.Icons:CART}
                    name="Mint Shop"/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Href"
        content={
          <p>
            "The URL to link to can be set with the "

            <code>"href"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[4, 7, 12]
            data={
              @format {
                <>
                  <Ui.Brand
                    icon={Ui.Icons:FLAME}
                    name="Mint"
                    href="/"/>

                  <Ui.Brand
                    href="/examples/dashboard"
                    icon={Ui.Icons:BEAKER}
                    name="Mint Labs"/>

                  <Ui.Brand
                    href="/examples/checkout"
                    icon={Ui.Icons:CART}
                    name="Mint Shop"/>
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
            highlight=[2, 7, 12]
            data={
              @format {
                <>
                  <Ui.Brand
                    size={Ui.Size::Px(12)}
                    icon={Ui.Icons:FLAME}
                    name="Mint"/>

                  <Ui.Brand
                    size={Ui.Size::Px(16)}
                    icon={Ui.Icons:FLAME}
                    name="Mint"/>

                  <Ui.Brand
                    size={Ui.Size::Px(20)}
                    icon={Ui.Icons:FLAME}
                    name="Mint"/>
                </>
              }
            }/>
        }/>
    </>
  }
}
