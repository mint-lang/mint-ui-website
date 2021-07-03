component Reference.Column {
  connect ListItems exposing {
    JUSTIFY_CONTENT_ITEMS,
    ORIENTATION_ITEMS,
    ALING_ITEMS_ITEMS
  }

  state justify : String = "stretch"
  state align : String = "stretch"
  state gap : Number = 20

  const CHILDREN =
    {
      @format {
        <div style="background: gray;min-width: 100px;min-height: 100px;"/>
      },
      @format {
        <div style="background: gray;min-width: 50px;min-height: 50px;"/>
      },
      @format {
        <div style="background: gray;min-width: 25px;min-height: 25px;"/>
      }
    }

  style demo {
    display: grid;
    height: 400px;
  }

  get playgroundCode : String {
    "Ui.Column"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("gap", gap)
    |> ComponentBuilder.addString("justify", justify)
    |> ComponentBuilder.addString("align", align)
    |> ComponentBuilder.addChild(CHILDREN[0][1])
    |> ComponentBuilder.addChild(CHILDREN[1][1])
    |> ComponentBuilder.addChild(CHILDREN[2][1])
    |> ComponentBuilder.setAddNewLines(false)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Column" }>>
        <p>"This component displays it's children in a vetical grid."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Column"</code>

            " below using the controls:"
          </p>
        }
        example={
          <Example
            fullWidth={true}
            controls=<{
              <Ui.Field label="Justify">
                <Ui.Native.Select
                  onChange={(value : String) { next { justify = value } }}
                  items={JUSTIFY_CONTENT_ITEMS}
                  value={justify}/>
              </Ui.Field>

              <Ui.Field label="Align">
                <Ui.Native.Select
                  onChange={(value : String) { next { align = value } }}
                  items={ALING_ITEMS_ITEMS}
                  value={align}/>
              </Ui.Field>

              <Ui.Field label="Gap (#{gap}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { gap = value } }}
                  value={gap}
                  max={100}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <div::demo>
                  <Ui.Column
                    gap={Ui.Size::Px(gap)}
                    justify={justify}
                    align={align}>

                    <{ CHILDREN[0][0] }>
                    <{ CHILDREN[1][0] }>
                    <{ CHILDREN[2][0] }>

                  </Ui.Column>
                </div>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Gap"
        content={
          <p>
            "The space betweem the items can be controlled usign the "

            <code>"gap"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={50}
            highlight=[1, 7, 13]
            data={
              @format {
                <>
                  <Ui.Column gap={Ui.Size::Px(10)}>
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Column>

                  <Ui.Column gap={Ui.Size::Px(30)}>
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Column>

                  <Ui.Column gap={Ui.Size::Px(60)}>
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Column>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Align"
        content={
          <p>
            "The the alignment of the items can be controlled usign the "

            <code>"align"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[1, 7, 13, 19]
            horizontalSpacing={50}
            data={
              @format {
                <>
                  <Ui.Column align="start">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Column>

                  <Ui.Column align="center">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Column>

                  <Ui.Column align="end">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Column>

                  <Ui.Column align="stretch">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Column>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Justify"
        content={
          <p>
            "The the justification of the items can be controlled usign the "

            <code>"justify"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[2, 10, 18, 26]
            horizontalSpacing={50}
            fullWidth={true}
            data={
              @format {
                <>
                  <div style="height: 400px;display:grid;">
                    <Ui.Column justify="start">
                      <div style="background: gray;min-height: 100px;min-width:100px;"/>
                      <div style="background: gray;min-height: 50px;min-width:50px;"/>
                      <div style="background: gray;min-height: 25px;min-width:25px;"/>
                    </Ui.Column>
                  </div>

                  <div style="height: 400px;display:grid;">
                    <Ui.Column justify="center">
                      <div style="background: gray;min-height: 100px;min-width:100px;"/>
                      <div style="background: gray;min-height: 50px;min-width:50px;"/>
                      <div style="background: gray;min-height: 25px;min-width:25px;"/>
                    </Ui.Column>
                  </div>

                  <div style="height: 400px;display:grid;">
                    <Ui.Column justify="end">
                      <div style="background: gray;min-height: 100px;min-width:100px;"/>
                      <div style="background: gray;min-height: 50px;min-width:50px;"/>
                      <div style="background: gray;min-height: 25px;min-width:25px;"/>
                    </Ui.Column>
                  </div>

                  <div style="height: 400px;display:grid;">
                    <Ui.Column justify="stretch">
                      <div style="background: gray;min-height: 100px;min-width:100px;"/>
                      <div style="background: gray;min-height: 50px;min-width:50px;"/>
                      <div style="background: gray;min-height: 25px;min-width:25px;"/>
                    </Ui.Column>
                  </div>
                </>
              }
            }/>
        }/>
    </>
  }
}
