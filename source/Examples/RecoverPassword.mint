component Examples.RecoverPassword {
  state errors : Map(String, Array(String)) = Map.empty()
  state email : String = ""

  fun submit (event : Html.Event) {
    sequence {
      errors =
        Validation.merge(
          [
            Validation.isNotBlank(email, {"email", "Please enter the email address."}),
            Validation.isValidEmail(email, {"email", "Please enter a valid email address."})
          ])

      next { errors = errors }

      if (Map.isEmpty(errors)) {
        parallel {
          Ui.Notifications.notifyDefault(<{ "An email would have been sent here...📭" }>)
          Window.navigate("/examples")
        }
      } else {
        next {  }
      }
    }
  }

  fun render : Html {
    <Ui.Layout.Centered maxContentWidth="320px">
      <Ui.Container
        gap={Ui.Size::Em(1.5)}
        orientation="vertical"
        justify="stretch">

        <Ui.Brand
          icon={Ui.Icons:BEAKER}
          name="Mint Labs"
          href="/examples"/>

        <Ui.Box title=<{ "Recover Password" }>>
          <Ui.Container
            orientation="vertical"
            gap={Ui.Size::Em(1)}
            align="stretch">

            <Ui.Field
              error={Validation.getFirstError("email", errors)}
              label="Email *">

              <Ui.Input
                onChange={(value : String) { next { email = value } }}
                invalid={Map.has("email", errors)}
                placeholder="john@doe.com"
                value={email}
                type="email"/>

            </Ui.Field>

            <Ui.Button
              iconAfter={Ui.Icons:ARROW_RIGHT}
              onClick={submit}
              label="Continue"/>

          </Ui.Container>
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

      </Ui.Container>
    </Ui.Layout.Centered>
  }
}
