component Examples.Register {
  state errors : Map(String, Array(String)) = Map.empty()
  state confirmation : String = ""
  state password : String = ""
  state email : String = ""

  fun submit (event : Html.Event) {
    let errors =
      Validation.merge(
        [
          Validation.isNotBlank(email, {"email", "Please enter the email address."}),
          Validation.isValidEmail(email, {"email", "Please enter a valid email address."}),
          Validation.isNotBlank(password, {"password", "Please enter the password."}),
          Validation.isNotBlank(confirmation, {"password-confirmation", "Please enter the password for confirmation."}),
          Validation.isSame(password, confirmation, {"password-confirmation", "The password confirmation must match the password."})
        ])

    await next { errors: errors }

    if (Map.isEmpty(errors)) {
      Ui.Notifications.notifyDefault(<{ "You are now registered and logged in 👋" }>)
      Window.navigate("/examples/dashboard")
    } else {
      next { }
    }
  }

  fun render : Html {
    <Ui.Layout.Centered maxContentWidth="320px">
      <Ui.Column gap={Ui.Size::Em(1.5)}>
        <Ui.Brand
          icon={Ui.Icons:BEAKER}
          name="Mint Labs"
          href="/examples"/>

        <Ui.Box title=<{ "Register" }>>
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

            <Ui.Field
              error={Validation.getFirstError(errors, "password")}
              label="Password *">

              <Ui.Input
                onChange={(value : String) { next { password: value } }}
                invalid={Map.has(errors, "password")}
                placeholder="12345678"
                value={password}
                type="password"/>

            </Ui.Field>

            <Ui.Field
              error={Validation.getFirstError(errors, "password-confirmation")}
              label="Password Confirmation *">

              <Ui.Input
                onChange={(value : String) { next { confirmation: value } }}
                invalid={Map.has(errors, "password-confirmation")}
                placeholder="12345678"
                value={confirmation}
                type="password"/>

            </Ui.Field>

            <Ui.Button
              iconAfter={Ui.Icons:ARROW_RIGHT}
              onClick={submit}
              label="Continue"/>
          </Ui.Column>
        </Ui.Box>

        <Ui.Content
          size={Ui.Size::Em(0.85)}
          textAlign="center">

          <div>
            "Forgot your password? "

            <a href="/examples/recover-password">
              "Recover it here."
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
