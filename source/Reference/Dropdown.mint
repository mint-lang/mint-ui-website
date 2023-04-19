component Reference.Dropdown {
  connect ListItems exposing { POSITIONS }
  connect Ui exposing { mobile }

  state closeOnOutsideClick : Bool = mobile
  state matchWidth : Bool = false
  state open : Bool = !mobile

  state position : String = "TopLeft"
  state offset : Number = 5
  state zIndex : Number = 1

  get playgroundCode : String {
    let content =
      "Ui.Dropdown.Panel"
      |> ComponentBuilder.new
      |> ComponentBuilder.addStringChild("Content")
      |> ComponentBuilder.toString()
      |> String.wrap("\n", "\n")
      |> String.indent(2, " ", false)

    let button =
      "Ui.Button"
      |> ComponentBuilder.new
      |> ComponentBuilder.addString("label", "Click to Toggle")
      |> ComponentBuilder.toString()
      |> String.wrap("\n", "\n")
      |> String.indent(2, " ", false)

    "Ui.Dropdown"
    |> ComponentBuilder.new
    |> ComponentBuilder.addExpression("position", "Ui.Position::#{position}")
    |> ComponentBuilder.addBool("closeOnOutsideClick", closeOnOutsideClick)
    |> ComponentBuilder.addBool("matchWidth", matchWidth)
    |> ComponentBuilder.addBool("open", open)
    |> ComponentBuilder.addNumber("offset", offset)
    |> ComponentBuilder.addExpression("element", button)
    |> ComponentBuilder.addExpression("content", content)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Dropdown" }>>
        <p>"A component for showing the user hidden content."</p>

        <p>
          "On desktop resolution the content is shown in a drop dow" \
          "n panel where as on mobile resolution it's shown in a mo" \
          "dal."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Dropdown"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Position">
                <Ui.Native.Select
                  onChange={(position : String) { next { position: position } }}
                  items={POSITIONS}
                  value={position}/>
              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Open">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { open: value } }}
                  checked={open}/>

              </Ui.Field>

              <Ui.Field
                label="Close on Outside Click"
                orientation={Ui.Field::Horizontal}>

                <Ui.Checkbox
                  onChange={(value : Bool) { next { closeOnOutsideClick: value } }}
                  checked={closeOnOutsideClick}/>

              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Match Width">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { matchWidth: value } }}
                  checked={matchWidth}/>

              </Ui.Field>

              <Ui.Field label="Offset (#{offset}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { offset: value } }}
                  value={offset}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Z-index (#{zIndex})">
                <Ui.Slider
                  onChange={(value : Number) { next { zIndex: value } }}
                  value={zIndex}
                  max={100}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.Dropdown
                  position={Ui.Position.fromString(position)}
                  closeOnOutsideClick={closeOnOutsideClick}
                  onClose={() { next { open: false } }}
                  matchWidth={matchWidth}
                  offset={offset}
                  zIndex={zIndex}
                  open={open}
                  element={
                    <Ui.Button
                      onClick={(event : Html.Event) { next { open: !open } }}
                      label="Click to Toggle"/>
                  }
                  content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Element"
        content={
          <p>
            "The element that acts as the initiator can be defined using the "

            <code>"element"</code>

            " property."
          </p>
        }
        example={
          if (mobile) {
            <Ui.ContentHint icon={Ui.Icons:INFO}>
              "The example only is available on desktop resolution!"
            </Ui.ContentHint>
          } else {
            <Example
              horizontalSpacing={20}
              controlled={true}
              highlight=[3, 8]
              data={
                @format {
                  <>
                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="A Button!"/>}
                      open={true}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<div>"A simple div!"</div>}
                      open={true}/>
                  </>
                }
              }/>
          }
        }/>

      <DocBox
        title="Content"
        content={
          <p>
            "The content can be defined using the "

            <code>"content"</code>

            " property."
          </p>
        }
        example={
          if (mobile) {
            <Ui.ContentHint icon={Ui.Icons:INFO}>
              "The example only is available on desktop resolution!"
            </Ui.ContentHint>
          } else {
            <Example
              horizontalSpacing={20}
              controlled={true}
              highlight=[2, 7]
              data={
                @format {
                  <>
                    <Ui.Dropdown
                      content={<div>"A simple div!"</div>}
                      element={<Ui.Button label="Element"/>}
                      open={true}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"A dropdown panel!"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      open={true}/>
                  </>
                }
              }/>
          }
        }/>

      <DocBox
        title="Open"
        content={
          <p>
            "The visible state of the panel can be controlled with the "

            <code>"open"</code>

            " property."
          </p>
        }
        example={
          if (mobile) {
            <Ui.ContentHint icon={Ui.Icons:INFO}>
              "The example only is available on desktop resolution!"
            </Ui.ContentHint>
          } else {
            <Example
              horizontalSpacing={20}
              controlled={true}
              highlight=[4, 9]
              data={
                @format {
                  <>
                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      open={false}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      open={true}/>
                  </>
                }
              }/>
          }
        }/>

      <DocBox
        title="Position"
        content={
          <p>
            "The position of the panel can be controlled with the "

            <code>"position"</code>

            " property."
          </p>
        }
        example={
          if (mobile) {
            <Ui.ContentHint icon={Ui.Icons:INFO}>
              "The example only is available on desktop resolution!"
            </Ui.ContentHint>
          } else {
            <Example
              highlight=[4, 11, 18, 25, 32, 39]
              horizontalSpacing={20}
              controlled={true}
              data={
                @format {
                  <>
                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      position={Ui.Position::TopLeft}
                      open={true}
                      offset={5}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      position={Ui.Position::TopCenter}
                      open={true}
                      offset={5}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      position={Ui.Position::TopRight}
                      open={true}
                      offset={5}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      position={Ui.Position::BottomLeft}
                      open={true}
                      offset={5}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      position={Ui.Position::BottomCenter}
                      open={true}
                      offset={5}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      position={Ui.Position::BottomRight}
                      open={true}
                      offset={5}/>
                  </>
                }
              }/>
          }
        }/>

      <DocBox
        title="Offset"
        content={
          <p>
            "The offset of the panel can be controlled with the "

            <code>"offset"</code>

            " property."
          </p>
        }
        example={
          if (mobile) {
            <Ui.ContentHint icon={Ui.Icons:INFO}>
              "The example only is available on desktop resolution!"
            </Ui.ContentHint>
          } else {
            <Example
              highlight=[5, 11, 17, 23]
              horizontalSpacing={20}
              controlled={true}
              data={
                @format {
                  <>
                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      open={true}
                      offset={5}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      open={true}
                      offset={10}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      open={true}
                      offset={25}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      open={true}
                      offset={50}/>
                  </>
                }
              }/>
          }
        }/>

      <DocBox
        title="Match Width"
        content={
          <p>
            "Whether or not the panel should match the width the element can be controlled with the "

            <code>"matchWidth"</code>

            " property."
          </p>
        }
        example={
          if (mobile) {
            <Ui.ContentHint icon={Ui.Icons:INFO}>
              "The example only is available on desktop resolution!"
            </Ui.ContentHint>
          } else {
            <Example
              horizontalSpacing={20}
              controlled={true}
              highlight=[4, 10]
              data={
                @format {
                  <>
                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      matchWidth={false}
                      open={true}/>

                    <Ui.Dropdown
                      content={<Ui.Dropdown.Panel>"Content"</Ui.Dropdown.Panel>}
                      element={<Ui.Button label="Element"/>}
                      matchWidth={true}
                      open={true}/>
                  </>
                }
              }/>
          }
        }/>

      <DocBox
        title="Close on Outside Click"
        content={
          <p>
            "Whether or not the panel should close when clicking outside of the panel can be controlled with the "

            <code>"closeOnOutsideClick"</code>

            " property."
          </p>
        }/>

      <DocBox
        title="Z-index"
        content={
          <p>
            "The z-index of the panel can be controlled with the "

            <code>"zIndex"</code>

            " property."
          </p>
        }/>
    </>
  }
}
