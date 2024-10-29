component Reference.Image {
  connect ListItems exposing {
    OBJECT_POSITION_ITEMS,
    OBJECT_FIT_ITEMS,
    IMAGE_ITEMS,
    IMAGES
  }

  state alt : String = "white concrete buildings under blue sky"
  state src : String = "beach.jpg"

  state transparent : Bool = false
  state draggable : Bool = false
  state fullWidth : Bool = false

  state objectPosition : String = "center"
  state objectFit : String = "cover"
  state borderRadius : String = ""

  state height : Number = 240
  state width : Number = 320

  get playgroundCode : String {
    "Ui.Image"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addString("alt", alt)
    |> ComponentBuilder.addSizePx("height", height)
    |> ComponentBuilder.addSizePx("width", width)
    |> ComponentBuilder.addString("borderRadius", borderRadius)
    |> ComponentBuilder.addString("objectPosition", objectPosition)
    |> ComponentBuilder.addString("objectFit", objectFit)
    |> ComponentBuilder.addBool("transparent", transparent)
    |> ComponentBuilder.addBool("draggable", draggable)
    |> ComponentBuilder.addBool("fullWidth", fullWidth)
    |> ComponentBuilder.addString("src", src)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Image"</>>
        <p>"An image component with multiple features:"</p>

        <ul>
          <li>"Lazy loads when it's near the visible portion of the viewport."</li>

          <li>
            "Has an overridable "
            <code>"border-radius"</code>
            "."
          </li>

          <li>"Fades in when the image is loaded."</li>
          <li>"Not draggable by default."</li>
          <li>"Set to cover the container with center position."</li>
        </ul>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.Image"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Src">
                <Ui.Select onChange={-> src} items={IMAGE_ITEMS} value={src}/>
              </Ui.Field>

              <Ui.Field label="Alt"><Ui.Input onChange={-> alt} value={alt}/></Ui.Field>

              <Ui.Field label="Object Fit">
                <Ui.Native.Select
                  onChange={-> objectFit}
                  items={OBJECT_FIT_ITEMS}
                  value={objectFit}
                />
              </Ui.Field>

              <Ui.Field label="Object Position">
                <Ui.Native.Select
                  onChange={-> objectPosition}
                  items={OBJECT_POSITION_ITEMS}
                  value={objectPosition}
                />
              </Ui.Field>

              <Ui.Field label="Width (#{width}px)">
                <Ui.Slider onChange={-> width} value={width} max={300} min={0}/>
              </Ui.Field>

              <Ui.Field label="Height (#{height}px)">
                <Ui.Slider onChange={-> height} value={height} max={300} min={0}/>
              </Ui.Field>

              <Ui.Field label="Border Radius">
                <Ui.Input onChange={-> borderRadius} value={borderRadius}/>
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Draggable">
                <Ui.Checkbox onChange={-> draggable} checked={draggable}/>
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Full Width">
                <Ui.Checkbox onChange={-> fullWidth} checked={fullWidth}/>
              </Ui.Field>

              <Ui.Field orientation={Ui.Field.Horizontal} label="Transparent">
                <Ui.Checkbox onChange={-> transparent} checked={transparent}/>
              </Ui.Field>
            </>
            data={
              {
                <Ui.Image
                  src={Map.get(IMAGES, src) or ""}
                  objectPosition={objectPosition}
                  height={Ui.Size.Px(height)}
                  borderRadius={borderRadius}
                  width={Ui.Size.Px(width)}
                  objectFit={objectFit}
                  draggable={draggable}
                  fullWidth={fullWidth}
                  alt={alt}
                />,
                playgroundCode
              }
            }
          />
        }
      />

      <DocBox
        title="Source"
        content={
          <p>
            "The source of the image can be controlled using the "
            <code>"src"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Image
                    src={@asset(../../assets/images/beach.jpg)}
                    height={Ui.Size.Px(240)}
                    width={Ui.Size.Px(240)}
                  />

                  <Ui.Image
                    src={@asset(../../assets/images/white-beach.jpg)}
                    height={Ui.Size.Px(240)}
                    width={Ui.Size.Px(240)}
                  />

                  <Ui.Image
                    src={@asset(../../assets/images/city.jpg)}
                    height={Ui.Size.Px(240)}
                    width={Ui.Size.Px(240)}
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Width and Height"
        content={
          <p>
            "The image dimensions can be controlled using the "
            <code>"width"</code>
            " and "
            <code>"height"</code>
            " properties."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Image
                    src={@asset(../../assets/images/road.jpg)}
                    height={Ui.Size.Px(100)}
                    width={Ui.Size.Px(100)}
                  />

                  <Ui.Image
                    src={@asset(../../assets/images/road.jpg)}
                    height={Ui.Size.Px(200)}
                    width={Ui.Size.Px(200)}
                  />

                  <Ui.Image
                    src={@asset(../../assets/images/road.jpg)}
                    height={Ui.Size.Px(300)}
                    width={Ui.Size.Px(300)}
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Full Width"
        content={
          <p>
            "The image can fill it parent containers width by setting the "
            <code>"fullWidth"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <div style="width: 120px">
                    <Ui.Image
                      src={@asset(../../assets/images/city.jpg)}
                      height={Ui.Size.Px(240)}
                      fullWidth={true}
                    />
                  </div>

                  <div style="width: 220px">
                    <Ui.Image
                      src={@asset(../../assets/images/city.jpg)}
                      height={Ui.Size.Px(240)}
                      fullWidth={true}
                    />
                  </div>

                  <div style="width: 320px">
                    <Ui.Image
                      src={@asset(../../assets/images/city.jpg)}
                      height={Ui.Size.Px(240)}
                      fullWidth={true}
                    />
                  </div>
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Draggable"
        content={
          <p>
            "The native dragging of the image can be controlled using the "
            <code>"draggable"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Image
                    src={@asset(../../assets/images/white-beach.jpg)}
                    height={Ui.Size.Px(240)}
                    width={Ui.Size.Px(320)}
                    draggable={false}
                  />

                  <Ui.Image
                    src={@asset(../../assets/images/white-beach.jpg)}
                    height={Ui.Size.Px(240)}
                    width={Ui.Size.Px(320)}
                    draggable={true}
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Alt"
        content={
          <p>
            "The alt text of the image can be controlled using the "
            <code>"alt"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <Ui.Image
                  src={@asset(../../assets/images/city.jpg)}
                  height={Ui.Size.Px(240)}
                  width={Ui.Size.Px(320)}
                  alt="A city."
                />
              }
            }
          />
        }
      />

      <DocBox
        title="Object Fit"
        content={
          <p>
            "The "
            <code>"object-fit"</code>
            " CSS proprerty can be controlled using the "
            <code>"objectFit"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Image
                    src={@asset(../../assets/images/road.jpg)}
                    height={Ui.Size.Px(240)}
                    width={Ui.Size.Px(300)}
                    objectFit="cover"
                  />

                  <Ui.Image
                    src={@asset(../../assets/images/road.jpg)}
                    height={Ui.Size.Px(240)}
                    width={Ui.Size.Px(300)}
                    objectFit="contain"
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Object Position"
        content={
          <p>
            "The "
            <code>"object-position"</code>
            " CSS proprerty can be controlled using the "
            <code>"objectPosition"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Image
                    src={@asset(../../assets/images/beach.jpg)}
                    height={Ui.Size.Px(240)}
                    width={Ui.Size.Px(300)}
                    objectPosition="top left"
                  />

                  <Ui.Image
                    src={@asset(../../assets/images/beach.jpg)}
                    height={Ui.Size.Px(240)}
                    width={Ui.Size.Px(300)}
                    objectPosition="center"
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Border Radius"
        content={
          <p>
            "The "
            <code>"border-radius"</code>
            " CSS proprerty can be controlled using the "
            <code>"borderRadius"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Image
                    src={@asset(../../assets/images/white-beach.jpg)}
                    height={Ui.Size.Px(200)}
                    width={Ui.Size.Px(200)}
                    borderRadius="100%"
                  />

                  <Ui.Image
                    src={@asset(../../assets/images/white-beach.jpg)}
                    height={Ui.Size.Px(200)}
                    width={Ui.Size.Px(200)}
                    borderRadius="30px"
                  />

                  <Ui.Image
                    src={@asset(../../assets/images/white-beach.jpg)}
                    height={Ui.Size.Px(200)}
                    width={Ui.Size.Px(200)}
                    borderRadius="20% / 50%"
                  />
                </>
              }
            }
          />
        }
      />
    </>
  }
}
