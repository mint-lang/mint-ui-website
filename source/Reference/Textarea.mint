component Reference.Textarea {
  state placeholder : String = "Placeholder..."
  state value : String = "Hello!"
  state disabled : Bool = false
  state invalid : Bool = false
  state size : Number = 16

  get playgroundCode {
    "Ui.Textarea"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addString("placeholder", placeholder)
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addString("value", value)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Textarea" }>>
        <p>
          "A basic component for getting multiline user input in a " \
          "text field. Keyboard and mouse can be used for providing" \
          " or changing data."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Textarea"</code>

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

              <Ui.Field label="Placeholder">
                <Ui.Input
                  onChange={(value : String) { next { placeholder = value } }}
                  value={placeholder}/>
              </Ui.Field>

              <Ui.Field label="Value">
                <Ui.Textarea
                  onChange={(value : String) { next { value = value } }}
                  value={value}/>
              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Disabled">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { disabled = value } }}
                  checked={disabled}/>

              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Invalid">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { invalid = value } }}
                  checked={invalid}/>

              </Ui.Field>
            }>
            data={
              {
                <Ui.Textarea
                  onChange={(value : String) { next { value = value } }}
                  placeholder={placeholder}
                  size={Ui.Size::Px(size)}
                  disabled={disabled}
                  invalid={invalid}
                  value={value}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Value"
        content={
          <p>
            "The value can be controlled with the "

            <code>"value"</code>

            " property."
          </p>
        }
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.Textarea value="john@doe.com"/>
              }
            }/>
        }/>

      <DocBox
        title="Behavior"
        content={
          <p>
            "The textrea supports multiple behaviors using the "

            <code>"behavior"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[2, 6, 10, 14, 18]
            verticalSpacing={20}
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Textarea
                    behavior="resize-horizontal"
                    value="Resize Horizontal"/>

                  <Ui.Textarea
                    behavior="resize-vertical"
                    value="Resize Vertical"/>

                  <Ui.Textarea
                    behavior="resize-both"
                    value="Resize Both"/>

                  <Ui.Textarea
                    behavior="static"
                    value="Static"/>

                  <Ui.Textarea
                    behavior="grow"
                    value="Grow"/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Placeholder"
        content={
          <p>
            "The placeholder can be changed with the "

            <code>"placeholder"</code>

            " property."
          </p>
        }
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.Textarea placeholder="Enter email address..."/>
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
            verticalSpacing={20}
            highlight=[2, 6, 10]
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Textarea
                    size={Ui.Size::Px(12)}
                    value="Size: 14px"/>

                  <Ui.Textarea
                    size={Ui.Size::Px(16)}
                    value="Size: 16px"/>

                  <Ui.Textarea
                    size={Ui.Size::Px(20)}
                    value="Size: 24px"/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Input Delay"
        hint={
          <Ui.ContentHint
            icon={Ui.Icons:NOTE}
            type="primary">

            "If an input delay is specified the component is semi-con" \
            "trolled, meaning that during the typing it's value can c" \
            "hange but it will revert back to the given value once th" \
            "e typing is settled."

          </Ui.ContentHint>
        }
        content=<{
          <p>
            "In some situations it is required to delay the change ev" \
            "ent so it only fires when the value is settled."
          </p>

          <p>
            "The delay duration can be controlled with the "

            <code>"inputDelay"</code>

            " property."
          </p>
        }>
        example={
          <Example
            verticalSpacing={20}
            highlight=[4, 9]
            data={
              @format {
                <>
                  <Ui.Textarea
                    onChange={(value : String) { Ui.Notifications.notifyDefault(<{ value }>) }}
                    placeholder="200ms delay..."
                    inputDelay={200}/>

                  <Ui.Textarea
                    onChange={(value : String) { Ui.Notifications.notifyDefault(<{ value }>) }}
                    placeholder="1000ms delay..."
                    inputDelay={1000}/>
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
            highlight=[3, 7]
            data={
              @format {
                <>
                  <Ui.Textarea
                    value="John Doe"
                    disabled={true}/>

                  <Ui.Textarea
                    value="John Doe"
                    disabled={false}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Invalid"
        content={
          <p>
            "The component can be marked invalid using the "

            <code>"invalid"</code>

            " property."
          </p>
        }
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.Textarea
                  value="John Doe"
                  invalid={true}/>
              }
            }/>
        }/>
    </>
  }
}
