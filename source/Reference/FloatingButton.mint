component Reference.FloatingButton {
  connect ListItems exposing { TYPES, ICON_ITEMS, getIcon }

  state type : String = "primary"
  state icon : String = "PLUS"
  state size : Number = 60

  get playgroundCode : String {
    "Ui.FloatingButton"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addIcon("icon", icon)
    |> ComponentBuilder.addString("type", type)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.FloatingButton" }>>
        <p>"A circual button to indicate the primary action on a page."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.FloatingButton"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Type">
                <Ui.Native.Select
                  onChange={(type : String) { next { type: type } }}
                  items={TYPES}
                  value={type}/>
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size: value } }}
                  value={size}
                  max={200}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Icon">
                <Ui.Native.Select
                  onChange={(value : String) { next { icon: value } }}
                  items={ICON_ITEMS}
                  value={icon}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.FloatingButton
                  icon={getIcon(icon)}
                  type={type}
                  size={Ui.Size::Px(size)}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Icon"
        content={
          <p>
            "The icon can be controlled with the "

            <code>"icon"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.FloatingButton icon={Ui.Icons:PLUS}/>
                  <Ui.FloatingButton icon={Ui.Icons:SETTINGS}/>
                  <Ui.FloatingButton icon={Ui.Icons:CALENDAR}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Types"
        content={
          <p>
            "The same types can be used as for a "

            <a href="/components/ui-button#types">
              "Ui.Button"
            </a>

            "."
          </p>
        }
        example={
          <Example
            highlight=[3, 7, 11, 15, 19, 23]
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.FloatingButton
                    icon={Ui.Icons:PLUS}
                    type="primary"/>

                  <Ui.FloatingButton
                    icon={Ui.Icons:PLUS}
                    type="secondary"/>

                  <Ui.FloatingButton
                    icon={Ui.Icons:PLUS}
                    type="warning"/>

                  <Ui.FloatingButton
                    icon={Ui.Icons:PLUS}
                    type="success"/>

                  <Ui.FloatingButton
                    icon={Ui.Icons:PLUS}
                    type="danger"/>

                  <Ui.FloatingButton
                    icon={Ui.Icons:PLUS}
                    type="faded"/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Size"
        content={
          <p>
            "The size can be controlled with the "

            <code>"size"</code>

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
                  <Ui.FloatingButton
                    size={Ui.Size::Px(40)}
                    icon={Ui.Icons:PLUS}/>

                  <Ui.FloatingButton
                    size={Ui.Size::Px(60)}
                    icon={Ui.Icons:PLUS}/>

                  <Ui.FloatingButton
                    size={Ui.Size::Px(80)}
                    icon={Ui.Icons:PLUS}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Click"
        content=<{
          <p>
            "The click event can be handled using the "

            <code>"onClick"</code>
            " property."
          </p>
        }>
        example={
          <Example
            highlight=[1]
            data={
              @format {
                <Ui.FloatingButton
                  onClick={(event : Html.Event) { Ui.Notifications.notifyDefault(<{ "Play!" }>) }}
                  icon={Ui.Icons:PLAY}/>
              }
            }/>
        }/>
    </>
  }
}
