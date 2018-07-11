record Pages.Button.State {
  label : String,
  disabled : Bool,
  outline : Bool,
  size : Number
}

component Pages.Button {
  state : Pages.Button.State {
    label = "Hello",
    disabled = false,
    outline = false,
    size = 14
  }

  fun render : Html {
    <Ui.Showcase.Page title="Ui.Button">
      <Ui.Button
        disabled={state.disabled}
        outline={state.outline}
        label={state.label}
        size={state.size}/>

      <Ui.Form.Field label="Label">
        <Ui.Input
          onChange={\value : String => next { state | label = value }}
          onClear={\ => next { state | label = "" }}
          value={state.label}/>
      </Ui.Form.Field>

      <Ui.Form.Field
        orientation="horizontal"
        label="Disabled">

        <Ui.Checkbox
          onChange={\value : Bool => next { state | disabled = value }}
          checked={state.disabled}/>

      </Ui.Form.Field>

      <Ui.Form.Field
        orientation="horizontal"
        label="Outline">

        <Ui.Checkbox
          onChange={\value : Bool => next { state | outline = value }}
          checked={state.outline}/>

      </Ui.Form.Field>

      <Ui.Form.Field label="Size">
        <Ui.Slider
          onChange={\value : Number => next { state | size = value }}
          value={state.size}
          max={100}
          min={0}/>
      </Ui.Form.Field>
    </Ui.Showcase.Page>
  }
}
