record Pages.Dropdown.State {
  open : Bool
}

component Pages.Dropdown {
  state : Pages.Dropdown.State { open = true }

  fun render : Html {
    <Ui.Showcase.Page title="Ui.Dropdown">
      <Ui.Dropdown
        onClose={\ => next { state | open = false }}
        position="left-center"
        offset={5}
        open={state.open}
        element={
          <Ui.Button
            onClick={\event : Html.Event => next { state | open = true }}
            label="Open"/>
        }
        content={
          <Ui.Dropdown.Panel>
            <{ "Content" }>
          </Ui.Dropdown.Panel>
        }/>
    </Ui.Showcase.Page>
  }
}
