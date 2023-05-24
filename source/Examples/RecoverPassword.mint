component Examples.RecoverPassword {
  state errors : Map(String, Array(String)) = Map.empty()
  state email : String = ""

  fun submit (event : Html.Event) {
    let errors =
      Validation.merge(
        [
          Validation.isNotBlank(email, {"email", "Please enter the email address."}),
          Validation.isValidEmail(email, {"email", "Please enter a valid email address."})
        ])

    await next { errors: errors }

    if Map.isEmpty(errors) {
      Ui.Notifications.notifyDefault(<{ "An email would have been sent here...📭" }>)
      Window.navigate("/examples")
    }
  }

  fun render : Html {
    <Ui.Layout.Centered maxContentWidth="320px">
      <Ui.Column gap={Ui.Size::Em(1.5)}>
        <Ui.Brand
          icon={Ui.Icons:BEAKER}
          name="Mint Labs"
          href="/examples"/>

        <Ui.Box title=<{ "Recover Password" }>>
          <Ui.Column gap={Ui.Size::Em(1)}>
            <Ui.Field
              error={Validation.getFirstError(errors, "email")}
              label="Email *">

              <Ui.Input
                onChange={(value : String) { next { email: value } }}
                invalid={Map.has(errors, "email")}
                placeholder="john@doe.com"
                value={email}
                type="email"/>

            </Ui.Field>

            <Ui.Button
              iconAfter={Ui.Icons:ARROW_RIGHT}
              onClick={submit}
              label="Continue"/>
          </Ui.Column>
        </Ui.Box>

        <Ui.Content
          textAlign="center"
          size={Ui.Size::Em(0.85)}>

          <div>
            "Need an account? "

            <a href="/examples/register">
              "Register here."
            </a>
          </div>

          <div>
            "Have an account? "

            <a href="/examples/login">
              "Login here."
            </a>
          </div>

        </Ui.Content>
      </Ui.Column>
    </Ui.Layout.Centered>
  }
}
