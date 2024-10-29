component Reference.DatePicker {
  connect ListItems exposing { POSITIONS }

  state value : Time = Time.atBeginningOfDay(Time.now())
  state position : String = "BottomRight"
  state disabled : Bool = false
  state invalid : Bool = false
  state offset : Number = 5
  state size : Number = 16

  get playgroundCode : String {
    let valueValue =
      "Time.from(#{`#{value}.getFullYear()`}, #{`#{value}.getMonth() + 1`}, #{`#{value}.getDate()`})"

    "Ui.DatePicker"
    |> ComponentBuilder.new
    |> ComponentBuilder.addExpression("position", "Ui.Position.#{position}")
    |> ComponentBuilder.addExpression("value", valueValue)
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addBool("invalid", invalid)
    |> ComponentBuilder.addNumber("offset", offset)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.DatePicker"</>>
        <p>
          "A simple component that allows the user to pick a date from a calendar."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.DatePicker"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Value">
                <Ui.DatePicker onChange={-> value} value={value}/>
              </Ui.Field>

              <Ui.Field label="Position">
                <Ui.Native.Select
                  onChange={-> position}
                  items={POSITIONS}
                  value={position}
                />
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider onChange={-> size} value={size} max={100} min={0}/>
              </Ui.Field>

              <Ui.Field label="Offset (#{offset}px)">
                <Ui.Slider onChange={-> offset} value={offset} max={100} min={0}/>
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Disabled">
                <Ui.Checkbox onChange={-> disabled} checked={disabled}/>
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Invalid">
                <Ui.Checkbox onChange={-> invalid} checked={invalid}/>
              </Ui.Field>
            </>
            data={
              {
                <Ui.DatePicker
                  position={Ui.Position.fromString(position)}
                  size={Ui.Size.Px(size)}
                  disabled={disabled}
                  onChange={-> value}
                  invalid={invalid}
                  offset={offset}
                  value={value}
                />,
                playgroundCode
              }
            }
          />
        }
      />

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
                <Ui.DatePicker value={Time.atBeginningOfDay(Time.now())}/>
              }
            }
          />
        }
      />

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
            data={
              @format {
                <Ui.DatePicker disabled={true}/>
              }
            }
          />
        }
      />

      <DocBox
        title="Invalid"
        content={
          <p>
            "The component can be makred invalid using the "
            <code>"invalid"</code>
            " property."
          </p>
        }
        example={
          <Example
            controlled={true}
            data={
              @format {
                <Ui.DatePicker invalid={true}/>
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
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.DatePicker size={Ui.Size.Px(12)}/>
                  <Ui.DatePicker size={Ui.Size.Px(16)}/>
                  <Ui.DatePicker size={Ui.Size.Px(20)}/>
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Position"
        content={
          <p>
            "The position property controls the panels position. "
            "For more information check out the the "
            <a href="/components/ui-dropdown#position">"same property"</a>
            " of the "
            <code>"Ui.Dropdown"</code>
          </p>
        }
      />

      <DocBox
        title="Offset"
        content={
          <p>
            "The offset property controls the panels offset. "
            "For more information check out the the "
            <a href="/components/ui-dropdown#offset">"same property"</a>
            " of the "
            <code>"Ui.Dropdown"</code>
          </p>
        }
      />
    </>
  }
}
