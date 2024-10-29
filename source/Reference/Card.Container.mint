component Reference.Card.Container {
  connect ListItems exposing { IMAGES, IMAGE_ITEMS }

  state thumbnail : String = "avatar.jpg"
  state content : String = "Some content"
  state subtitle : String = "Sub title"
  state title : String = "Title"

  get playgroundCode : String {
    "Ui.Card.Container"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addStringHtml("content", content)
    |> ComponentBuilder.addStringHtml("subtitle", subtitle)
    |> ComponentBuilder.addString("thumbnail", thumbnail)
    |> ComponentBuilder.addStringHtml("title", title)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<>"Ui.Card.Container"</>>
        <p>"An component for content to use in cards."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "
            <code>"Ui.Card.Container"</code>
            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<>
              <Ui.Field label="Thumbnail">
                <Ui.Select
                  onChange={-> thumbnail}
                  items={IMAGE_ITEMS}
                  value={thumbnail}
                />
              </Ui.Field>

              <Ui.Field label="Title">
                <Ui.Input onChange={-> title} value={title}/>
              </Ui.Field>

              <Ui.Field label="Subtitle">
                <Ui.Input onChange={-> subtitle} value={subtitle}/>
              </Ui.Field>

              <Ui.Field label="Content">
                <Ui.Input onChange={-> content} value={content}/>
              </Ui.Field>
            </>
            data={
              {
                <Ui.Card.Container
                  thumbnail={Map.get(IMAGES, thumbnail) or ""}
                  subtitle=<>subtitle</>
                  content=<>content</>
                  title=<>title</>
                />,
                playgroundCode
              }
            }
          />
        }
      />

      <DocBox
        title="Content"
        content={
          <p>
            "The content can be controlled using the "
            <code>"content"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Card.Container content=<>"Some content!"</>/>
                  <Ui.Card.Container content=<>"Some other content!"</>/>

                  <Ui.Card.Container
                    content=<><Ui.Button label="Some content!"/></>
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Title"
        content={
          <p>
            "The content for the title can be controlled using the "
            <code>"title"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Card.Container title=<>"Some title!"</>/>
                  <Ui.Card.Container title=<>"Some other title!"</>/>
                  <Ui.Card.Container title=<><Ui.Button label="Some title!"/></>/>
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Subtitle"
        content={
          <p>
            "The content for the subtitle can be controlled using the "
            <code>"subtitle"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Card.Container subtitle=<>"Some subtitle!"</>/>
                  <Ui.Card.Container subtitle=<>"Some other subtitle!"</>/>

                  <Ui.Card.Container
                    subtitle=<><Ui.Button label="Some subtitle!"/></>
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Thumbnail"
        content={
          <p>
            "The thumbnail can be controlled using the "
            <code>"thumbnail"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <>
                  <Ui.Card.Container
                    thumbnail={@asset(../../assets/images/avatar.jpg)}
                  />

                  <Ui.Card.Container
                    thumbnail={@asset(../../assets/images/beach.jpg)}
                  />

                  <Ui.Card.Container
                    thumbnail={@asset(../../assets/images/app-books.jpg)}
                  />
                </>
              }
            }
          />
        }
      />

      <DocBox
        title="Image"
        content={
          <p>
            "The thumbnail can be replaced with custom content with "
            <code>"image"</code>
            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={20}
            data={
              @format {
                <Ui.Card.Container
                  subtitle=<>"Subtitle"</>
                  title=<>"Title"</>
                  image={<Ui.Icon size={Ui.Size.Em(2.5)} icon={Ui.Icons.MINT}/>}
                />
              }
            }
          />
        }
      />
    </>
  }
}
