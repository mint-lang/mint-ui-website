component Pages.Dropdown {
  state position : Maybe(String) = Maybe.just("top-left")
  state shouldAutomaticallyClose : Bool = false
  state open : Bool = false

  get positionItems : Array(String) {
    [
      "top-left",
      "top-right",
      "top-center",
      "bottom-left",
      "bottom-center",
      "bottom-right"
    ]
  }

  fun render : Html {
    <Ui.Showcase.Page title="Ui.Dropdown">
      <Ui.Dropdown
        shouldAutomaticallyClose={shouldAutomaticallyClose}
        onClose={() : Void => { next { open = false } }}
        position={Maybe.withDefault("top-left", position)}
        offset={5}
        open={open}
        element={
          <Ui.Button
            onClick={(event : Html.Event) : Void => { next { open = !open } }}
            label="Toggle"/>
        }
        content={
          <Ui.Dropdown.Panel>
            <{ "Content" }>
          </Ui.Dropdown.Panel>
        }/>

      <Ui.Form.Field label="Position">
        <Ui.Chooser
          onChange={(position : Maybe(String)) : Void => { next { position = position } }}
          selected={position}
          items={positionItems}/>
      </Ui.Form.Field>

      <Ui.Form.Field
        label="Open"
        orientation="horizontal">

        <Ui.Checkbox
          onChange={(value : Bool) : Void => { next { open = value } }}
          checked={open}/>

      </Ui.Form.Field>

      <Ui.Form.Field
        label="shouldAutomaticallyClose"
        orientation="horizontal">

        <Ui.Checkbox
          onChange={(value : Bool) : Void => { next { shouldAutomaticallyClose = value } }}
          checked={shouldAutomaticallyClose}/>

      </Ui.Form.Field>
    </Ui.Showcase.Page>
  }
}
