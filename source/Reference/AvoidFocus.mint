component Reference.AvoidFocus {
  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.AvoidFocus" }>>
        <p>
          "This component makes it possible to have arbitrary HTML " \
          "content which behaves like static content (cannot be int" \
          "eracted with)."
        </p>
      </Ui.Box>

      <DocBox
        title="Demo"
        content={<p>"You can check it out below - the child elements cannot be interacted with."</p>}
        example={
          <Example
            data={
              @format {
                <Ui.AvoidFocus>
                  <Ui.Container>
                    <Ui.Button label="Can't click me!"/>
                    <Ui.Input placeholder="Can't focus me!"/>
                  </Ui.Container>
                </Ui.AvoidFocus>
              }
            }/>
        }/>
    </>
  }
}
