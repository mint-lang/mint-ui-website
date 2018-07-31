component Pages.Button {
  state label : String = "Hello"
  state disabled : Bool = false
  state outline : Bool = false
  state size : Number = 14

  fun render : Html {
    <Ui.Showcase.Page title="Ui.Button">
      <Ui.Button
        disabled={disabled}
        outline={outline}
        label={label}
        size={size}/>

      <Ui.Form.Field label="Label">
        <Ui.Input
          onChange={(value : String) : Void => { next { label = value } }}
          onClear={() : Void => { next { label = "" } }}
          value={label}/>
      </Ui.Form.Field>

      <Ui.Form.Field
        orientation="horizontal"
        label="Disabled">

        <Ui.Checkbox
          onChange={(value : Bool) : Void => { next { disabled = value } }}
          checked={disabled}/>

      </Ui.Form.Field>

      <Ui.Form.Field
        orientation="horizontal"
        label="Outline">

        <Ui.Checkbox
          onChange={(value : Bool) : Void => { next { outline = value } }}
          checked={outline}/>

      </Ui.Form.Field>

      <Ui.Form.Field label="Size">
        <Ui.Slider
          onChange={(value : Number) : Void => { next { size = value } }}
          value={size}
          max={100}
          min={0}/>
      </Ui.Form.Field>
    </Ui.Showcase.Page>
  }
}
