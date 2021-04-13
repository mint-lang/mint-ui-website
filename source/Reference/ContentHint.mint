component Reference.ContentHint {
  connect ListItems exposing { ICON_ITEMS, TYPES, getIcon }

  state content : String = "This is a hint!"
  state type : String = "danger"
  state icon : String = "ALERT"
  state size : Number = 16

  get playgroundCode : String {
    "Ui.ContentHint"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addExpression("icon", "Ui.Icons:#{icon}")
    |> ComponentBuilder.addString("type", type)
    |> ComponentBuilder.addStringChild(content)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.ContentHint" }>>
        <p>"Provides a visible hint in content (like documentation)."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"ContentHint.Hint"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Type">
                <Ui.Native.Select
                  onChange={(type : String) { next { type = type } }}
                  value={type}
                  items={TYPES}/>
              </Ui.Field>

              <Ui.Field label="Icon">
                <Ui.Native.Select
                  onChange={(icon : String) { next { icon = icon } }}
                  items={ICON_ITEMS}
                  value={icon}/>
              </Ui.Field>

              <Ui.Field label="Content">
                <Ui.Input
                  onChange={(value : String) { next { content = value } }}
                  value={content}/>
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
                <Ui.ContentHint
                  size={Ui.Size::Px(size)}
                  icon={getIcon(icon)}
                  type={type}>

                  <{ content }>

                </Ui.ContentHint>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Content"
        content={<p>"The content of the component are its children:"</p>}
        example={
          <Example
            data={
              @format {
                <Ui.ContentHint
                  icon={Ui.Icons:ALERT}
                  type="warning">

                  "Hey! I'm the content now!"

                </Ui.ContentHint>
              }
            }/>
        }/>

      <DocBox
        title="Types"
        content={
          <p>
            "The component supports the same types as the "

            <code>"Ui.Button"</code>

            " component:"
          </p>
        }
        example={
          <Example
            highlight=[3, 11, 19, 27, 35, 43]
            verticalSpacing={20}
            data={
              @format {
                <>
                  <Ui.ContentHint
                    icon={Ui.Icons:CODE}
                    type="primary">

                    "Primary"

                  </Ui.ContentHint>

                  <Ui.ContentHint
                    icon={Ui.Icons:ALERT}
                    type="danger">

                    "Danger"

                  </Ui.ContentHint>

                  <Ui.ContentHint
                    icon={Ui.Icons:ALERT}
                    type="warning">

                    "Warning"

                  </Ui.ContentHint>

                  <Ui.ContentHint
                    icon={Ui.Icons:CHECK}
                    type="success">

                    "Success"

                  </Ui.ContentHint>

                  <Ui.ContentHint
                    icon={Ui.Icons:BOOKMARK}
                    type="secondary">

                    "Secondary"

                  </Ui.ContentHint>

                  <Ui.ContentHint
                    icon={Ui.Icons:NOTE}
                    type="faded">

                    "Faded"

                  </Ui.ContentHint>
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
            highlight=[2, 11, 20]
            data={
              @format {
                <>
                  <Ui.ContentHint
                    size={Ui.Size::Px(12)}
                    icon={Ui.Icons:CODE}
                    type="primary">

                    "12px"

                  </Ui.ContentHint>

                  <Ui.ContentHint
                    size={Ui.Size::Px(16)}
                    icon={Ui.Icons:CODE}
                    type="primary">

                    "16px"

                  </Ui.ContentHint>

                  <Ui.ContentHint
                    size={Ui.Size::Px(20)}
                    icon={Ui.Icons:CODE}
                    type="primary">

                    "20px"

                  </Ui.ContentHint>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Icon"
        content={
          <p>
            "The icon which is displayed on the left can be controlled with the "

            <code>"icon"</code>

            " property:"
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[2, 10, 18]
            data={
              @format {
                <>
                  <Ui.ContentHint
                    icon={Ui.Icons:CODE}
                    type="primary">

                    "Code"

                  </Ui.ContentHint>

                  <Ui.ContentHint
                    icon={Ui.Icons:ALERT}
                    type="primary">

                    "Alert"

                  </Ui.ContentHint>

                  <Ui.ContentHint
                    icon={Ui.Icons:BELL}
                    type="primary">

                    "Bell"

                  </Ui.ContentHint>
                </>
              }
            }/>
        }/>
    </>
  }
}
