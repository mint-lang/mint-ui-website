component Reference.Grid {
  connect Ui exposing { mobile }

  state mobileWidth : Number = 50
  state width : Number = 200
  state gap : Number = 20

  get playgroundCode : String {
    "Ui.Grid"
    |> ComponentBuilder.new()
    |> ComponentBuilder.setAddNewLines(false)
    |> ComponentBuilder.addSizePx("mobileWidth", mobileWidth)
    |> ComponentBuilder.addSizePx("width", width)
    |> ComponentBuilder.addSizePx("gap", gap)
    |> ComponentBuilder.addChild("<div style=\"background: gray;height: 100px;\"/>")
    |> ComponentBuilder.addChild("<div style=\"background: gray;height: 100px;\"/>")
    |> ComponentBuilder.addChild("<div style=\"background: gray;height: 100px;\"/>")
    |> ComponentBuilder.addChild("<div style=\"background: gray;height: 100px;\"/>")
    |> ComponentBuilder.addChild("<div style=\"background: gray;height: 100px;\"/>")
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Grid" }>>
        <p>"Arranges its children in a responsive grid based on column size."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Grid"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            fullWidth={true}
            controls=<{
              <Ui.Field label="Width (#{width}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { width: value } }}
                  value={width}
                  max={400}
                  min={100}/>
              </Ui.Field>

              <Ui.Field label="Mobile Width (#{mobileWidth}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { mobileWidth: value } }}
                  value={mobileWidth}
                  max={400}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Gap (#{gap}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { gap: value } }}
                  value={gap}
                  max={150}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.Grid
                  mobileWidth={Ui.Size::Px(mobileWidth)}
                  width={Ui.Size::Px(width)}
                  gap={Ui.Size::Px(gap)}>

                  <div style="background: gray;height: 100px;"/>
                  <div style="background: gray;height: 100px;"/>
                  <div style="background: gray;height: 100px;"/>
                  <div style="background: gray;height: 100px;"/>
                  <div style="background: gray;height: 100px;"/>

                </Ui.Grid>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Width"
        content={
          <p>
            "The width of a column can be controlled using the "

            <code>"width"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[4, 18, 32]
            verticalSpacing={50}
            data={
              if (mobile) {
                @format {
                  <>
                    <div style="width: 260px;">
                      <Ui.Grid
                        mobileWidth={Ui.Size::Px(40)}
                        width={Ui.Size::Px(40)}
                        gap={Ui.Size::Px(10)}>

                        <div style="background: gray;height: 80px;"/>
                        <div style="background: gray;height: 80px;"/>
                        <div style="background: gray;height: 80px;"/>
                        <div style="background: gray;height: 80px;"/>

                      </Ui.Grid>
                    </div>

                    <div style="width: 260px;">
                      <Ui.Grid
                        mobileWidth={Ui.Size::Px(80)}
                        width={Ui.Size::Px(80)}
                        gap={Ui.Size::Px(10)}>

                        <div style="background: gray;height: 80px;"/>
                        <div style="background: gray;height: 80px;"/>
                        <div style="background: gray;height: 80px;"/>
                        <div style="background: gray;height: 80px;"/>

                      </Ui.Grid>
                    </div>

                    <div style="width: 260px;">
                      <Ui.Grid
                        mobileWidth={Ui.Size::Px(100)}
                        width={Ui.Size::Px(100)}
                        gap={Ui.Size::Px(10)}>

                        <div style="background: gray;height: 80px;"/>
                        <div style="background: gray;height: 80px;"/>
                        <div style="background: gray;height: 80px;"/>
                        <div style="background: gray;height: 80px;"/>

                      </Ui.Grid>
                    </div>
                  </>
                }
              } else {
                @format {
                  <>
                    <div style="width: 500px;">
                      <Ui.Grid
                        mobileWidth={Ui.Size::Px(100)}
                        width={Ui.Size::Px(100)}
                        gap={Ui.Size::Px(10)}>

                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>

                      </Ui.Grid>
                    </div>

                    <div style="width: 500px;">
                      <Ui.Grid
                        mobileWidth={Ui.Size::Px(150)}
                        width={Ui.Size::Px(150)}
                        gap={Ui.Size::Px(10)}>

                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>

                      </Ui.Grid>
                    </div>

                    <div style="width: 500px;">
                      <Ui.Grid
                        mobileWidth={Ui.Size::Px(300)}
                        width={Ui.Size::Px(200)}
                        gap={Ui.Size::Px(10)}>

                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>

                      </Ui.Grid>
                    </div>
                  </>
                }
              }
            }/>
        }/>

      <DocBox
        title="Gap"
        content={
          <p>
            "The gap between the columns can be controlled using the "

            <code>"gap"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[4, 17, 30]
            verticalSpacing={50}
            data={
              if (mobile) {
                @format {
                  <>
                    <div style="width: 250px;">
                      <Ui.Grid
                        mobileWidth={Ui.Size::Px(100)}
                        gap={Ui.Size::Px(10)}>

                        <div style="background: gray;height: 50px;"/>
                        <div style="background: gray;height: 50px;"/>
                        <div style="background: gray;height: 50px;"/>
                        <div style="background: gray;height: 50px;"/>

                      </Ui.Grid>
                    </div>

                    <div style="width: 250px;">
                      <Ui.Grid
                        mobileWidth={Ui.Size::Px(100)}
                        gap={Ui.Size::Px(20)}>

                        <div style="background: gray;height: 50px;"/>
                        <div style="background: gray;height: 50px;"/>
                        <div style="background: gray;height: 50px;"/>
                        <div style="background: gray;height: 50px;"/>

                      </Ui.Grid>
                    </div>

                    <div style="width: 250px;">
                      <Ui.Grid
                        mobileWidth={Ui.Size::Px(100)}
                        gap={Ui.Size::Px(40)}>

                        <div style="background: gray;height: 50px;"/>
                        <div style="background: gray;height: 50px;"/>
                        <div style="background: gray;height: 50px;"/>
                        <div style="background: gray;height: 50px;"/>

                      </Ui.Grid>
                    </div>
                  </>
                }
              } else {
                @format {
                  <>
                    <div style="width: 500px;">
                      <Ui.Grid
                        width={Ui.Size::Px(100)}
                        gap={Ui.Size::Px(10)}>

                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>

                      </Ui.Grid>
                    </div>

                    <div style="width: 500px;">
                      <Ui.Grid
                        width={Ui.Size::Px(100)}
                        gap={Ui.Size::Px(20)}>

                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>

                      </Ui.Grid>
                    </div>

                    <div style="width: 500px;">
                      <Ui.Grid
                        width={Ui.Size::Px(100)}
                        gap={Ui.Size::Px(40)}>

                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>
                        <div style="background: gray;height: 100px;"/>

                      </Ui.Grid>
                    </div>
                  </>
                }
              }
            }/>
        }/>
    </>
  }
}
