component Reference.Card.Image {
  connect ListItems exposing {
    OBJECT_POSITION_ITEMS,
    OBJECT_FIT_ITEMS,
    IMAGE_ITEMS,
    IMAGES
  }

  state objectPosition : String = "center"
  state objectFit : String = "cover"

  state src : String = "beach.jpg"
  state height : Number = 240

  get playgroundCode : String {
    "Ui.Card.Image"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("height", height)
    |> ComponentBuilder.addString("objectPosition", objectPosition)
    |> ComponentBuilder.addString("objectFit", objectFit)
    |> ComponentBuilder.addString("src", src)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Card.Image" }>>
        <p>"An image component to use in cards."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Card.Image"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            fullWidth={true}
            controls=<{
              <Ui.Field label="Src">
                <Ui.Select
                  onChange={(value : String) { next { src = value } }}
                  items={IMAGE_ITEMS}
                  value={src}/>
              </Ui.Field>

              <Ui.Field label="Object Fit">
                <Ui.Native.Select
                  onChange={(value : String) { next { objectFit = value } }}
                  items={OBJECT_FIT_ITEMS}
                  value={objectFit}/>
              </Ui.Field>

              <Ui.Field label="Object Position">
                <Ui.Native.Select
                  onChange={(value : String) { next { objectPosition = value } }}
                  items={OBJECT_POSITION_ITEMS}
                  value={objectPosition}/>
              </Ui.Field>

              <Ui.Field label="Height (#{height}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { height = value } }}
                  value={height}
                  max={300}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.Card.Image
                  src={Map.get(src, IMAGES) or ""}
                  objectPosition={objectPosition}
                  height={Ui.Size::Px(height)}
                  objectFit={objectFit}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Source"
        content={
          <p>
            "The source for the image can be controlled using the "

            <code>"src"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[2, 6, 10]
            data={
              @format {
                <>
                  <Ui.Card.Image
                    src={@asset(../../assets/images/white-beach.jpg)}
                    height={Ui.Size::Px(240)}/>

                  <Ui.Card.Image
                    src={@asset(../../assets/images/city.jpg)}
                    height={Ui.Size::Px(240)}/>

                  <Ui.Card.Image
                    src={@asset(../../assets/images/road.jpg)}
                    height={Ui.Size::Px(240)}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Height"
        content={
          <p>
            "The height of the image can be controlled using the "

            <code>"height"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[3, 7, 11]
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Card.Image
                    src={@asset(../../assets/images/white-beach.jpg)}
                    height={Ui.Size::Px(100)}/>

                  <Ui.Card.Image
                    src={@asset(../../assets/images/city.jpg)}
                    height={Ui.Size::Px(200)}/>

                  <Ui.Card.Image
                    src={@asset(../../assets/images/road.jpg)}
                    height={Ui.Size::Px(300)}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Object Fit"
        content={
          <p>
            "The "
            <code>"object-fit"</code>

            " CSS proprerty can be controlled using the "

            <code>"object-fit"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[5, 12]
            data={
              @format {
                <>
                  <div style="width: 300px">
                    <Ui.Card.Image
                      src={@asset(../../assets/images/white-beach.jpg)}
                      height={Ui.Size::Px(240)}
                      objectFit="cover"/>
                  </div>

                  <div style="width: 300px">
                    <Ui.Card.Image
                      src={@asset(../../assets/images/white-beach.jpg)}
                      height={Ui.Size::Px(240)}
                      objectFit="contain"/>
                  </div>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Object Position"
        content={
          <p>
            "The "
            <code>"object-position"</code>

            " CSS proprerty can be controlled using the "

            <code>"object-position"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            highlight=[5, 13]
            data={
              @format {
                <>
                  <div style="width: 300px">
                    <Ui.Card.Image
                      src={@asset(../../assets/images/white-beach.jpg)}
                      height={Ui.Size::Px(240)}
                      objectPosition="top left"
                      objectFit="contain"/>
                  </div>

                  <div style="width: 300px">
                    <Ui.Card.Image
                      src={@asset(../../assets/images/white-beach.jpg)}
                      height={Ui.Size::Px(240)}
                      objectPosition="bottom left"
                      objectFit="contain"/>
                  </div>
                </>
              }
            }/>
        }/>
    </>
  }
}
