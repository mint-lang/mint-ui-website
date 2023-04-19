component Reference.ScrollPanel {
  connect ListItems exposing { ORIENTATION_ITEMS }

  state orientation : String = "Vertical"
  state extraPadding : Number = 0
  state shadowSize : Number = 20
  state maxSize : Number = 300

  const ITEM =
    @format {
      <div style="width:200px;height:200px;background:var(--content-color);margin:5px;"/>
    }

  get playgroundCode : String {
    "Ui.ScrollPanel"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addString("orientation", orientation)
    |> ComponentBuilder.addNumber("extraPadding", extraPadding)
    |> ComponentBuilder.addNumber("shadowSize", shadowSize)
    |> ComponentBuilder.addNumber("maxSize", maxSize)
    |> ComponentBuilder.addChild(ITEM[1])
    |> ComponentBuilder.addChild(ITEM[1])
    |> ComponentBuilder.addChild(ITEM[1])
    |> ComponentBuilder.addChild(ITEM[1])
    |> ComponentBuilder.addChild(ITEM[1])
    |> ComponentBuilder.addChild(ITEM[1])
    |> ComponentBuilder.setAddNewLines(false)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.ScrollPanel" }>>
        <p>
          "This component offers a panel which can be scrolled eith" \
          "er horizontally or vertically while providing a hint (sh" \
          "adow) when there is more content."
        </p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.ScrollPanel"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Orientation">
                <Ui.Native.Select
                  onChange={(value : String) { next { orientation: value } }}
                  items={ORIENTATION_ITEMS}
                  value={orientation}/>
              </Ui.Field>

              <Ui.Field label="Shadow Size">
                <Ui.Slider
                  onChange={(value : Number) { next { shadowSize: value } }}
                  value={shadowSize}
                  max={200}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Maximum Size">
                <Ui.Slider
                  onChange={(value : Number) { next { maxSize: value } }}
                  value={maxSize}
                  max={1000}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Extra Padding">
                <Ui.Slider
                  onChange={(value : Number) { next { extraPadding: value } }}
                  value={extraPadding}
                  max={100}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.ScrollPanel
                  extraPadding={extraPadding}
                  orientation={orientation}
                  shadowSize={shadowSize}
                  maxSize={maxSize}>

                  <{ ITEM[0] }>
                  <{ ITEM[0] }>
                  <{ ITEM[0] }>
                  <{ ITEM[0] }>
                  <{ ITEM[0] }>
                  <{ ITEM[0] }>

                </Ui.ScrollPanel>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Orientation"
        content={
          <p>
            "The orientation of the component can be set using the "

            <code>"orientation"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.ScrollPanel orientation="vertical">
                    <div style="width:300px;height:400px;background:var(--content-color)"/>
                  </Ui.ScrollPanel>

                  <Ui.ScrollPanel orientation="horizontal">
                    <div style="width:400px;height:300px;background:var(--content-color)"/>
                  </Ui.ScrollPanel>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Max Size"
        content={
          <p>
            "The maximum size of the component can be set using the "

            <code>"maxSize"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.ScrollPanel maxSize={50}>
                    <div style="width:250px;height:300px;background:var(--content-color)"/>
                  </Ui.ScrollPanel>

                  <Ui.ScrollPanel maxSize={100}>
                    <div style="width:250px;height:300px;background:var(--content-color)"/>
                  </Ui.ScrollPanel>

                  <Ui.ScrollPanel maxSize={200}>
                    <div style="width:250px;height:300px;background:var(--content-color)"/>
                  </Ui.ScrollPanel>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Shadow Size"
        content={
          <p>
            "The size of the shadow can be set using the "

            <code>"shadowSize"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.ScrollPanel shadowSize={50}>
                    <div style="width:250px;height:500px;background:var(--content-color)"/>
                  </Ui.ScrollPanel>

                  <Ui.ScrollPanel shadowSize={100}>
                    <div style="width:250px;height:500px;background:var(--content-color)"/>
                  </Ui.ScrollPanel>

                  <Ui.ScrollPanel shadowSize={200}>
                    <div style="width:250px;height:500px;background:var(--content-color)"/>
                  </Ui.ScrollPanel>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Extra Padding"
        content={
          <p>
            "The padding between the scrollbar and the content can be set using the "

            <code>"extraPadding"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.ScrollPanel extraPadding={0}>
                    <div style="width:250px;height:500px;background:var(--content-color)"/>
                  </Ui.ScrollPanel>

                  <Ui.ScrollPanel extraPadding={10}>
                    <div style="width:250px;height:500px;background:var(--content-color)"/>
                  </Ui.ScrollPanel>

                  <Ui.ScrollPanel extraPadding={20}>
                    <div style="width:250px;height:500px;background:var(--content-color)"/>
                  </Ui.ScrollPanel>
                </>
              }
            }/>
        }/>
    </>
  }
}
