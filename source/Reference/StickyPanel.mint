component Reference.StickyPanel {
  connect ListItems exposing { POSITIONS }

  state position : String = "BottomLeft"
  state shouldCalculate : Bool = true
  state passThrough : Bool = false
  state offset : Number = 10
  state zIndex : Number = 0

  const ELEMENT =
    @format {
      <div style="width: 250px;height:100px;background:var(--secondary-color);"/>
    }

  const CONTENT =
    @format {
      <div style="width: 100px;height:50px;background:var(--primary-color);"/>
    }

  get playgroundCode : String {
    "Ui.StickyPanel"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addExpression("element", ELEMENT[1])
    |> ComponentBuilder.addExpression("content", CONTENT[1])
    |> ComponentBuilder.addExpression("position", "Ui.Position::#{position}")
    |> ComponentBuilder.addBool("shouldCalculate", shouldCalculate)
    |> ComponentBuilder.addBool("passThrough", passThrough)
    |> ComponentBuilder.addNumber("offset", offset)
    |> ComponentBuilder.addNumber("zIndex", zIndex)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.StickyPanel" }>>
        <p>
          "A component for positioning "
          <b>"content"</b>
          " that sticks to an "
          <b>"element"</b>
          "."
        </p>

        <ul>
          <li>
            "The content is rendered outside and "
            <b>"fixed"</b>
            " positioned."
          </li>

          <li>
            "If the content cannot be shown at the requested position" \
            " it will be shown in the inverse position: "

            <code>"Ui.Position::BottomLeft"</code>
            " becomes "
            <code>"Ui.Position::TopLeft"</code>
            "."
          </li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.StickyPanel"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Position">
                <Ui.Native.Select
                  onChange={(value : String) { next { position: value } }}
                  items={POSITIONS}
                  value={position}/>
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

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Should Calculate Position">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { shouldCalculate: value } }}
                  checked={shouldCalculate}/>

              </Ui.Field>

              <Ui.Field
                orientation={Ui.Field::Horizontal}
                label="Pass Through">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { passThrough: value } }}
                  checked={passThrough}/>

              </Ui.Field>
            }>
            data={
              {
                <Ui.StickyPanel
                  position={Ui.Position.fromString(position)}
                  shouldCalculate={shouldCalculate}
                  passThrough={passThrough}
                  content={CONTENT[0]}
                  element={ELEMENT[0]}
                  offset={offset}
                  zIndex={zIndex}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Position"
        content={
          <p>
            "The position of the content can be set with the "

            <code>"position"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[4, 10, 16]
            data={
              @format {
                <>
                  <Ui.StickyPanel
                    content={<div style="width: 100px;height:50px;background:var(--primary-color);"/>}
                    element={<div style="width: 250px;height:100px;background:var(--secondary-color);"/>}
                    position={Ui.Position::BottomLeft}
                    offset={10}/>

                  <Ui.StickyPanel
                    content={<div style="width: 100px;height:50px;background:var(--primary-color);"/>}
                    element={<div style="width: 250px;height:100px;background:var(--secondary-color);"/>}
                    position={Ui.Position::TopRight}
                    offset={10}/>

                  <Ui.StickyPanel
                    content={<div style="width: 100px;height:50px;background:var(--primary-color);"/>}
                    element={<div style="width: 250px;height:100px;background:var(--secondary-color);"/>}
                    position={Ui.Position::RightCenter}
                    offset={10}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Offset"
        content={
          <p>
            "The offset of the content from the element can be set with the "

            <code>"offset"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[4, 9, 14]
            data={
              @format {
                <>
                  <Ui.StickyPanel
                    content={<div style="width: 100px;height:50px;background:var(--primary-color);"/>}
                    element={<div style="width: 250px;height:100px;background:var(--secondary-color);"/>}
                    offset={5}/>

                  <Ui.StickyPanel
                    content={<div style="width: 100px;height:50px;background:var(--primary-color);"/>}
                    element={<div style="width: 250px;height:100px;background:var(--secondary-color);"/>}
                    offset={10}/>

                  <Ui.StickyPanel
                    content={<div style="width: 100px;height:50px;background:var(--primary-color);"/>}
                    element={<div style="width: 250px;height:100px;background:var(--secondary-color);"/>}
                    offset={20}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Pass Through"
        content={
          <p>
            "The content can be made non interactive using with the "

            <code>"passThrough"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[4, 10]
            data={
              @format {
                <>
                  <Ui.StickyPanel
                    element={<div style="width: 250px;height:100px;background:var(--secondary-color);"/>}
                    content={<Ui.Button label="Click Me!"/>}
                    passThrough={false}
                    offset={5}/>

                  <Ui.StickyPanel
                    element={<div style="width: 250px;height:100px;background:var(--secondary-color);"/>}
                    content={<Ui.Button label="Click Me!"/>}
                    passThrough={true}
                    offset={5}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Should Calculate"
        content={
          <p>
            "The  "

            <code>"shouldCalculate"</code>

            " property decides if to calculate the position of the content."
          </p>
        }/>

      <DocBox
        title="Z-Index"
        content={
          <p>
            "The  "

            <code>"zIndex"</code>

            " property sets the z-index of the content."
          </p>
        }/>
    </>
  }
}
