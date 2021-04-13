component Reference.Pagination {
  state disabled : Bool = false
  state sidePages : Number = 1
  state perPage : Number = 10
  state total : Number = 300
  state size : Number = 16
  state page : Number = 0

  get playgroundCode {
    "Ui.Pagination"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addSizePx("size", size)
    |> ComponentBuilder.addBool("disabled", disabled)
    |> ComponentBuilder.addNumber("sidePages", sidePages)
    |> ComponentBuilder.addNumber("perPage", perPage)
    |> ComponentBuilder.addNumber("total", total)
    |> ComponentBuilder.addNumber("page", page)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Pagination" }>>
        <p>"A component to handle page selecting on data which has many pages."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Pagination"</code>

            " below using the controls."
          </p>
        }
        example={
          <Example
            controls=<{
              <Ui.Field label="Page (#{page})">
                <Ui.Slider
                  onChange={(value : Number) { next { page = value } }}
                  max={Math.floor(Math.max(total - 1, 0) / perPage)}
                  value={page}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Total (#{total})">
                <Ui.Slider
                  onChange={
                    (value : Number) {
                      next
                        {
                          total = value,
                          page = 0
                        }
                    }
                  }
                  value={total}
                  max={300}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Side Pages (#{sidePages})">
                <Ui.Slider
                  onChange={(value : Number) { next { sidePages = value } }}
                  value={sidePages}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Per Page (#{perPage})">
                <Ui.Slider
                  onChange={
                    (value : Number) {
                      next
                        {
                          perPage = value,
                          page = 0
                        }
                    }
                  }
                  value={perPage}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field label="Size (#{size}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { size = value } }}
                  value={size}
                  max={100}
                  min={0}/>
              </Ui.Field>

              <Ui.Field
                orientation="horizontal"
                label="Disabled">

                <Ui.Checkbox
                  onChange={(value : Bool) { next { disabled = value } }}
                  checked={disabled}/>

              </Ui.Field>
            }>
            data={
              {
                <Ui.Pagination
                  onChange={(value : Number) { next { page = value } }}
                  size={Ui.Size::Px(size)}
                  sidePages={sidePages}
                  disabled={disabled}
                  perPage={perPage}
                  total={total}
                  page={page}/>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Page"
        content={
          <p>
            "The current page can be controlled with the "

            <code>"page"</code>

            " property."
          </p>
        }
        hint={
          <Ui.ContentHint
            icon={Ui.Icons:INFO}
            type="primary">

            "The pagination is zero based which means that the first page is zero (0)."

          </Ui.ContentHint>
        }
        example={
          <Example
            controlled={true}
            highlight=[2]
            data={
              @format {
                <Ui.Pagination
                  total={30}
                  page={1}/>
              }
            }/>
        }/>

      <DocBox
        title="Per Page"
        content={
          <p>
            "The number of items per page can be set with the "

            <code>"perPage"</code>

            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            highlight=[2, 7, 12]
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Pagination
                    perPage={30}
                    total={300}
                    page={0}/>

                  <Ui.Pagination
                    perPage={100}
                    total={300}
                    page={0}/>

                  <Ui.Pagination
                    perPage={300}
                    total={30}
                    page={0}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Total Pages"
        content={
          <p>
            "The total number of items can be set with the "

            <code>"total"</code>

            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            highlight=[3, 8, 13]
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Pagination
                    perPage={10}
                    total={10}
                    page={0}/>

                  <Ui.Pagination
                    perPage={10}
                    total={40}
                    page={0}/>

                  <Ui.Pagination
                    perPage={10}
                    total={100}
                    page={0}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Side Pages"
        content={
          <p>
            "The number of pages displayed in either side of the curr" \
            "ent page can be changed with the "

            <code>"sidePages"</code>

            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            highlight=[2, 7, 12]
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Pagination
                    sidePages={1}
                    total={90}
                    page={5}/>

                  <Ui.Pagination
                    sidePages={2}
                    total={90}
                    page={5}/>

                  <Ui.Pagination
                    sidePages={3}
                    total={90}
                    page={5}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Size"
        content={
          <p>
            "The size of the component can be set with the "

            <code>"size"</code>

            " property (in pixels)."
          </p>
        }
        example={
          <Example
            verticalSpacing={20}
            highlight=[2, 7, 12]
            controlled={true}
            data={
              @format {
                <>
                  <Ui.Pagination
                    size={Ui.Size::Px(12)}
                    total={30}
                    page={1}/>

                  <Ui.Pagination
                    size={Ui.Size::Px(16)}
                    total={30}
                    page={1}/>

                  <Ui.Pagination
                    size={Ui.Size::Px(20)}
                    total={30}
                    page={1}/>
                </>
              }
            }/>
        }/>

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
            verticalSpacing={20}
            controlled={true}
            highlight=[2, 7]
            data={
              @format {
                <>
                  <Ui.Pagination
                    disabled={false}
                    total={30}
                    page={1}/>

                  <Ui.Pagination
                    disabled={true}
                    total={30}
                    page={1}/>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Change Event"
        content={
          <p>
            "The component calls the "

            <code>"onChange"</code>

            " property when clicking on one of it's buttons."
          </p>
        }
        example={
          <Example
            controlled={true}
            highlight=[1]
            data={
              @format {
                <Ui.Pagination
                  onChange={
                    (page : Number) {
                      Ui.Notifications.notifyDefault(<{ "Page selected: #{page}" }>)
                    }
                  }
                  total={30}
                  page={1}/>
              }
            }/>
        }/>
    </>
  }
}
