record Pages.Dropdown.State {
  shouldAutomaticallyClose : Bool,
  position : Maybe(String),
  open : Bool
}

component Pages.Dropdown {
  state : Pages.Dropdown.State {
    shouldAutomaticallyClose = false,
    position = Maybe.just("top-left"),
    open = false
  }

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
        shouldAutomaticallyClose={state.shouldAutomaticallyClose}
        onClose={\ => next { state | open = false }}
        position={Maybe.withDefault("top-left", state.position)}
        offset={5}
        open={state.open}
        element={
          <Ui.Button
            onClick={\event : Html.Event => next { state | open = !state.open }}
            label="Toggle"/>
        }
        content={
          <Ui.Dropdown.Panel>
            <{ "Content" }>
          </Ui.Dropdown.Panel>
        }/>

      <Ui.Form.Field label="Position">
        <Ui.Chooser
          onChange={\position : Maybe(String) => next { state | position = position }}
          selected={state.position}
          items={positionItems}/>
      </Ui.Form.Field>

      <Ui.Form.Field
        label="Open"
        orientation="horizontal">

        <Ui.Checkbox
          onChange={\value : Bool => next { state | open = value }}
          checked={state.open}/>

      </Ui.Form.Field>

      <Ui.Form.Field
        label="shouldAutomaticallyClose"
        orientation="horizontal">

        <Ui.Checkbox
          onChange={\value : Bool => next { state | shouldAutomaticallyClose = value }}
          checked={state.shouldAutomaticallyClose}/>

      </Ui.Form.Field>
    </Ui.Showcase.Page>
  }
}
