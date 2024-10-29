component Reference.Book {
  connect ListItems exposing { IMAGES, IMAGE_ITEMS }

  state src : String = "book-cover.jpg"
  state alt : String = "A good book!"
  state href : String = ""

  state perspective : Number = 700
  state borderRadius : Number = 5
  state thickness : Number = 30
  state rotation : Number = 20
  state height : Number = 300
  state width : Number = 200
  state offset : Number = 5

  get playgroundCode : String {
    "Ui.Book"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addString("src", src)
    |> ComponentBuilder.addString("alt", alt)
    |> ComponentBuilder.addNumber("perspective", perspective)
    |> ComponentBuilder.addNumber("borderRadius", borderRadius)
    |> ComponentBuilder.addNumber("thickness", thickness)
    |> ComponentBuilder.addNumber("rotation", rotation)
    |> ComponentBuilder.addNumber("height", height)
    |> ComponentBuilder.addNumber("width", width)
    |> ComponentBuilder.addNumber("offset", offset)
    |> ComponentBuilder.addString("href", href)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Book"</>>
        <p>"A simple 3D book component (using CSS)."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.Book"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Source">
                <Ui.Select onChange={-> src} items={IMAGE_ITEMS} value={src}/>
              </Ui.Field>

              <Ui.Field label="Alt"><Ui.Input onChange={-> alt} value={alt}/></Ui.Field>
              <Ui.Field label="Href"><Ui.Input onChange={-> href} value={href}/></Ui.Field>

              <Ui.Field label="Height (#{height}px)">
                <Ui.Slider onChange={-> height} value={height} max={360} min={0}/>
              </Ui.Field>

              <Ui.Field label="Width (#{width}px)">
                <Ui.Slider onChange={-> width} value={width} max={360} min={0}/>
              </Ui.Field>

              <Ui.Field label="Perspective (#{perspective}px)">
                <Ui.Slider
                  onChange={-> perspective}
                  value={perspective}
                  max={2000}
                  min={0}
                />
              </Ui.Field>

              <Ui.Field label="Thickness (#{thickness}px)">
                <Ui.Slider
                  onChange={-> thickness}
                  value={thickness}
                  max={100}
                  min={0}
                />
              </Ui.Field>

              <Ui.Field label="Border Radius (#{borderRadius}px)">
                <Ui.Slider
                  onChange={-> borderRadius}
                  value={borderRadius}
                  max={30}
                  min={0}
                />
              </Ui.Field>

              <Ui.Field label="Offset (#{offset}px)">
                <Ui.Slider onChange={-> offset} value={offset} max={50} min={0}/>
              </Ui.Field>

              <Ui.Field label="Rotation (#{rotation}deg)">
                <Ui.Slider
                  onChange={-> rotation}
                  value={rotation}
                  max={360}
                  min={0}
                />
              </Ui.Field>
            </>
            data={
              {
                <Ui.Book
                  src={Map.get(IMAGES, src) or ""}
                  borderRadius={borderRadius}
                  perspective={perspective}
                  thickness={thickness}
                  rotation={rotation}
                  offset={offset}
                  height={height}
                  width={width}
                  href={href}
                  alt={alt}
                />,
                playgroundCode
              }
            }
          />
        }
      />
    </>
  }
}
