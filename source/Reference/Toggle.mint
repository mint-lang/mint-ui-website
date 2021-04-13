component Pages.Toggle {
  state offLabel : String = "OFF"
  state onLabel : String = "ON"

  state disabled : Bool = false
  state checked : Bool = false
  state width : Number = 5.5
  state size : Number = 16

  get playgroundCode {
    "Ui.Toggle"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizeEm("width", width)
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addBool("checked", checked)
    |> ComponentBuilder.addString("offLabel", offLabel)
    |> ComponentBuilder.addString("onLabel", onLabel)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Toggle" }>>
        <p>"This component is used to toggle the state of a single setting on or off."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Toggle"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="On Label">
                <Ui.Input
                  onChange={(value : String) { next { onLabel = value } }}
                  value={onLabel}/>
              </Ui.Field>

              <Ui.Field label="Off Label">
                <Ui.Input
                  onChange={(value : String) { next { offLabel = value } }}
                  value={offLabel}/>
              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="checked">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { checked = value } }}
                  checked={checked}/>

              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="disabled">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { disabled = value } }}
                  checked={disabled}/>

              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size = value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Width (#{width}em)">
                <Ui.Slider
                  onChange={(value : Number) { next { width = value } }}
                  value={width}
                  step={0.5}
                  max={40}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.Toggle
                  onChange={(value : Bool) { next { checked = value } }}
                  width={Ui.Size::Em(width)}
                  size={Ui.Size::Px(size)}
                  disabled={disabled}
                  offLabel={offLabel}
                  onLabel={onLabel}
                  checked={checked}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Labels"
        content={
          <p>
            "The the labels can be controlled by the "

            <code>"onLabel"</code>

            " and "

            <code>"offLabel"</code>

            " properties."
          </p>
        }
        example={
          <Example
            highlight=[3, 4, 8, 9, 13, 14]
            horizontalSpacing={20}
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Toggle
                    checked={false}
                    offLabel=""
                    onLabel=""/>

                  <Ui.Toggle
                    checked={false}
                    offLabel="NO"
                    onLabel="YES"/>

                  <Ui.Toggle
                    width={Ui.Size::Em(11)}
                    offLabel="ENABLED"
                    onLabel="DISABLED"
                    checked={true}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="State"
        content={
          <p>
            "The state of the component can be set with the "

            <code>"checked"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Toggle checked={false}/>
                  <Ui.Toggle checked={true}/>
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
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Toggle size={Ui.Size::Px(12)}/>
                  <Ui.Toggle size={Ui.Size::Px(16)}/>
                  <Ui.Toggle size={Ui.Size::Px(20)}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Width"
        content={
          <p>
            "Since we cannot accuratly measure the size of the labels" \
            ", the width of the component needs to be set manually us" \
            "ing the "

            <code>"width"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Toggle width={Ui.Size::Em(6)}/>
                  <Ui.Toggle width={Ui.Size::Em(10)}/>
                  <Ui.Toggle width={Ui.Size::Em(14)}/>
                </>
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
            horizontalSpacing={20}
            controlled={true}
            highlight=[2, 6]
            data={
              @format {
                <>
                  <Ui.Toggle
                    disabled={true}
                    checked={false}/>

                  <Ui.Toggle
                    disabled={true}
                    checked={true}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Change Event"
        content={
          <p>
            "The component triggers the "

            <code>"onChange"</code>

            " event when clicked."
          </p>
        }
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.Toggle
                  onChange={
                    (value : Bool) {
                      Ui.Notifications.notifyDefault(<{ Bool.toString(value) }>)
                    }
                  }/>
              }
            }/>
        }/>
    </>
  }
}
