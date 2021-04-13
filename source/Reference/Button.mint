component Reference.Button {
  connect ListItems exposing { TYPES, ICON_ITEMS, getIcon }

  state breakWords : Bool = false
  state disabled : Bool = false
  state ellipsis : Bool = true

  state label : String = "Download"
  state type : String = "primary"
  state href : String = ""
  state size : Number = 16

  state iconBefore : String = "DESKTOP_DOWNLOAD"
  state iconAfter : String = ""

  get playgroundCode {
    "Ui.Button"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addIcon("iconBefore", iconBefore)
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addIcon("iconAfter", iconAfter)
    |> ComponentBuilder.addBool("breakWords", breakWords)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addBool("ellipsis", ellipsis)
    |> ComponentBuilder.addString("label", label)
    |> ComponentBuilder.addString("type", type)
    |> ComponentBuilder.addString("href", href)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Button" }>>
        <p>
          "Buttons communicate actions that users can take. They ar" \
          "e typically placed throughout your UI, in places like:"
        </p>

        <ul>
          <li>"Dialogs"</li>

          <li>"Modal windows"</li>

          <li>"Forms"</li>

          <li>"Cards"</li>

          <li>"Toolbars"</li>
        </ul>

        <p>
          "A button contains a label and optional icons before or a" \
          "fter it."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Button"</code>

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

              <Ui.Field label="Type">
                <Ui.Native.Select
                  onChange={(type : String) { next { type = type } }}
                  items={TYPES}
                  value={type}/>
              </Ui.Field>

              <Ui.Field label="Label">
                <Ui.Input
                  onChange={(value : String) { next { label = value } }}
                  value={label}/>
              </Ui.Field>

              <Ui.Field label="Href">
                <Ui.Input
                  onChange={(value : String) { next { href = value } }}
                  value={href}/>
              </Ui.Field>

              <Ui.Field label="Icon Before">
                <Ui.Native.Select
                  onChange={(icon : String) { next { iconBefore = icon } }}
                  items={ICON_ITEMS}
                  value={iconBefore}/>
              </Ui.Field>

              <Ui.Field label="Icon After">
                <Ui.Native.Select
                  onChange={(icon : String) { next { iconAfter = icon } }}
                  items={ListItems:ICON_ITEMS}
                  value={iconAfter}/>
              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Break Words">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { breakWords = value } }}
                  checked={breakWords}/>

              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Ellipsis">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { ellipsis = value } }}
                  checked={ellipsis}/>

              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Disabled">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { disabled = value } }}
                  checked={disabled}/>

              </Ui.Field>
            }>
            data={
              {
                <Ui.Button
                  iconBefore={getIcon(iconBefore)}
                  iconAfter={getIcon(iconAfter)}
                  size={Ui.Size::Px(size)}
                  breakWords={breakWords}
                  disabled={disabled}
                  ellipsis={ellipsis}
                  label={label}
                  type={type}
                  href={href}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Types"
        content=<{
          <p>"There are some pre defined types, each serving its own semantic purpose:"</p>

          <ul>
            <li>
              <code>"primary"</code>

              " - indicates the primary action (should be only one per page)"
            </li>

            <li>
              <code>"secondary"</code>

              " - indicates an action, this is the most common type"
            </li>

            <li>
              <code>"warning"</code>

              " - indicates that the following action can be dangerous"
            </li>

            <li>
              <code>"success"</code>

              " - indicates that an action before has successfully completed"
            </li>

            <li>
              <code>"danger"</code>

              " - indicates that the following action is irreversible, " \
              "a confirmation should precede the action"
            </li>

            <li>
              <code>"faded"</code>

              " - indicates an action which does not attract attention"
            </li>
          </ul>
        }>
        example={
          <Example
            highlight=[3, 7, 11, 15, 19, 23]
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Button
                    label="Primary"
                    type="primary"/>

                  <Ui.Button
                    label="Secondary"
                    type="secondary"/>

                  <Ui.Button
                    label="Warning"
                    type="warning"/>

                  <Ui.Button
                    label="Success"
                    type="success"/>

                  <Ui.Button
                    label="Danger"
                    type="danger"/>

                  <Ui.Button
                    label="Faded"
                    type="faded"/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Size"
        content={
          <p>
            "The size of the button can be set with the "

            <code>"size"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[2, 6, 10, 14, 18]
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Button
                    size={Ui.Size::Px(12)}
                    label="Size: 12px"/>

                  <Ui.Button
                    size={Ui.Size::Px(16)}
                    label="Size: 16px"/>

                  <Ui.Button
                    size={Ui.Size::Px(20)}
                    label="Size: 20px"/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Icons"
        content={
          <p>
            "An "

            <a href="/components/ui-icon">
              "icon"
            </a>

            " can be specified to appear before and/or after the label."
          </p>
        }
        example={
          <Example
            highlight=[1, 2]
            data={
              @format {
                <Ui.Button
                  iconBefore={Ui.Icons:DESKTOP_DOWNLOAD}
                  iconAfter={Ui.Icons:DESKTOP_DOWNLOAD}
                  label="Download"/>
              }
            }/>
        }/>

      <DocBox
        title="Link"
        content={
          <p>
            "The component can be used as a link by providing a value for the "

            <code>"href"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[3]
            data={
              @format {
                <Ui.Button
                  iconBefore={Ui.Icons:ARROW_LEFT}
                  label="Back"
                  href="/"/>
              }
            }/>
        }/>

      <DocBox
        title="Disabled"
        content={
          <p>
            "The component can be disabled using the "

            <code>"disabled"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[3]
            data={
              @format {
                <Ui.Button
                  iconBefore={Ui.Icons:ALERT}
                  label="Self Destruct"
                  disabled={true}
                  type="danger"/>
              }
            }/>
        }/>

      <DocBox
        title="Events"
        content=<{
          <p>"The component can take three types of events."</p>

          <ul>
            <li>
              <code>"onMouseDown"</code>
              " - when the mouse is down."
            </li>

            <li>
              <code>"onMouseUp"</code>
              " - when the mouse is up."
            </li>

            <li>
              <code>"onClick"</code>
              " - a click (after the mouse up)."
            </li>
          </ul>
        }>
        example={
          <Example
            highlight={Array.range(4, 18)}
            data={
              @format {
                <Ui.Button
                  iconBefore={Ui.Icons:ALERT}
                  label="Click!"
                  type="warning"
                  onMouseDown={
                    (event : Html.Event) {
                      Ui.Notifications.notifyDefault(<{ "MouseDown!" }>)
                    }
                  }
                  onMouseUp={
                    (event : Html.Event) {
                      Ui.Notifications.notifyDefault(<{ "MouseUp!" }>)
                    }
                  }
                  onClick={
                    (event : Html.Event) {
                      Ui.Notifications.notifyDefault(<{ "Click!" }>)
                    }
                  }/>
              }
            }/>
        }/>
    </>
  }
}
