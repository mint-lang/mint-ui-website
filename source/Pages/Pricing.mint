component Pages.Pricing {
  connect Ui exposing { mobile }

  style title {
    font-family: var(--title-font-family);
    text-align: center;
    margin-bottom: 0;
    font-size: 3em;
  }

  style subtitle {
    margin-bottom: -1em;
    margin-top: 0.5em;

    text-align: center;
    font-size: 1.25em;
  }

  style grid {
    grid-gap: 3em;
    display: grid;

    max-width: 72em;
    margin: 0 auto;

    if (mobile) {
      grid-template-columns: 1fr;
    } else {
      grid-template-columns: 1fr 1fr;
    }

    > div > *:first-child {
      margin-top: 0;
    }
  }

  style items {
    justify-content: center;
    align-items: center;
    grid-gap: 3em;
    display: grid;

    > * {
      if (!mobile) {
        min-height: 46.25em;
      }
    }

    if (mobile) {
      grid-template-columns: 1fr;
    } else {
      grid-template-columns: repeat(auto-fit, 22em);
    }
  }

  style hr {
    border: 0;
    border-top: 0.125em solid var(--content-border);

    max-width: 72em;

    if (mobile) {
      margin: 2em auto;
    } else {
      margin: 4em auto;
    }
  }

  fun render : Html {
    <div>
      <h1::title>"Pricing"</h1>

      <p::subtitle>
        "Get a company license for "
        <b>"Mint UI"</b>

        " and leverage it's components to build "
        <b>"beautiful and reliable web applications"</b>
        "."
      </p>

      <hr::hr/>

      <div::items>
        <Ui.PricingItem
          name=<{ "Free License" }>
          image={
            <Ui.Icon
              icon={@svg(../../assets/svgs/license.svg)}
              size={Ui.Size::Em(4)}/>
          }
          actions=<{
            <Ui.Button
              iconBefore={Ui.Icons:DESKTOP_DOWNLOAD}
              href="/documentation/installation"
              size={Ui.Size::Em(1.25)}
              label="Install"/>
          }>
          description=<{
            <p>
              <b>"Mint UI"</b>
              " can be used commercially with a free license by:"
            </p>

            <ul>
              <li>"Individuals"</li>

              <li>
                "Small teams"
                <br/>
                "(3 or less employees)"
              </li>
            </ul>
          }>/>

        <Ui.PricingItem
          price={Maybe::Just({"$", "200", "/ one time"})}
          name=<{ "Lifetime License" }>
          size={
            if (mobile) {
              Ui.Size::Em(1)
            } else {
              Ui.Size::Em(1.05)
            }
          }
          image={
            <Ui.Icon
              size={Ui.Size::Em(4)}
              icon={@svg(../../assets/svgs/license-buy.svg)}/>
          }
          actions=<{
            <Ui.Button
              iconBefore={Ui.Icons:CART}
              onClick={Promise.never1}
              size={Ui.Size::Em(1.25)}
              href="https://gum.co/mint-ui"
              label="Buy a license"
              target="_blank"
              type="danger"/>
          }>
          description=<{
            <p>
              "This license gives your company the "
              <b>"permanent right"</b>
              " to use "
              <b>"Mint UI"</b>
              " in the software it creates."
            </p>

            <p>"In addition:"</p>

            <ul>
              <li>"Priority for component requests"</li>
              <li>"Priority support for issues"</li>

              <li>
                "Priority support via e-mail"
                <br/>
                "(within 24 hours)"
              </li>

              <li>
                "Priority support via Discord"
                <br/>
                "(in a private channel or direct message - within 24 hours)"
              </li>
            </ul>
          }>/>

        <Ui.PricingItem
          name=<{ "Yearly License" }>
          image={
            <Ui.Icon
              icon={@svg(../../assets/svgs/license-recurring.svg)}
              size={Ui.Size::Em(4)}/>
          }
          price={Maybe::Just({"$", "50", "/ year"})}
          actions=<{
            <Ui.Button
              iconBefore={Ui.Icons:CART}
              onClick={Promise.never1}
              size={Ui.Size::Em(1.25)}
              href="https://gum.co/mint-ui-license"
              label="Buy a license"
              target="_blank"
              type="danger"/>
          }>
          description=<{
            <p>
              "This license gives your company the right to use "
              <b>"Mint UI"</b>
              " in the software it creates "
              <b>"for a year"</b>
              "."
            </p>

            <p>"In addition:"</p>

            <ul>
              <li>"Priority for component requests"</li>
              <li>"Priority support for issues"</li>

              <li>
                "Priority support via e-mail"
                <br/>
                "(within 24 hours)"
              </li>

              <li>
                "Priority support via Discord"
                <br/>
                "(in a private channel or direct message - within 24 hours)"
              </li>
            </ul>
          }>/>
      </div>

      <hr::hr/>

      <Ui.Content>
        <div::grid>
          <div>
            <h3>"Who is eligible for the free license?"</h3>

            <p>
              "You are eligible to use "
              <b>"Mint UI"</b>
              " for free if you are:"
            </p>

            <ul>
              <li>"an individual"</li>
              <li>"a for-profit organisation with up to 3 employees"</li>

              <li>
                "a non-profit or not-for-profit organisation evaluating w" \
                "hether "

                <b>"Mint UI"</b>

                " is a good fit, and are not yet using it in a commercial" \
                " way"
              </li>
            </ul>

            <h3>"I am unsure if I qualify for the free license."</h3>

            <p>
              "Don't hesitate to "

              <a
                href="mailto:gusztav.szikszai@gmail.com"
                target="_blank">

                "contact us"

              </a>

              " if you need confirmation that your use case is acceptab" \
              "le."
            </p>

            <h3>
              "Why is "
              <b>"Mint UI"</b>
              " free for some and paid for others?"
            </h3>

            <p>
              <b>"Mint UI"</b>

              " works similarly as many open source projects, in that t" \
              "he code is openly available on Github and that individua" \
              "ls use it freely and contribute back. But to pay for the" \
              " time that it takes to maintain such an ambitious projec" \
              "t, we need to generate money. This is also good for you:" \
              " You get regular updates, good support, motivated mainta" \
              "iners and an overall healthy product. By separating indi" \
              "viduals and companies, we are charging those who are mos" \
              "t able to afford it."
            </p>

            <h3>"What kind of commercial use is allowed?"</h3>

            <p>
              "Any commercial use case is allowed as long as you are no" \
              "t selling "

              <b>"Mint UI"</b>

              " as a product itself or allowing people to circumvent ca" \
              "ses where they would have to buy a license themselves."
            </p>
          </div>

          <div>
            <h3>"What does prioritized support mean?"</h3>

            <p>
              "Support is provided on a best-effort basis, but we will " \
              "respond first to people who own a company license. We tr" \
              "y to reply and help everybody who files an issue or cont" \
              "acts us. We recommend to ask questions or get help in pu" \
              "blic channels such as Github Issues or Discord whenever " \
              "possible where community members also have the chance to" \
              " reply."
            </p>

            <h3>"What if these plans don't fit our use case?"</h3>

            <p>
              "You can "

              <a
                href="mailto:gusztav.szikszai@gmail.com"
                target="_blank">

                "contact us"

              </a>

              " if you would like to discuss a custom agreement."
            </p>

            <h3>"Is there a refund period?"</h3>

            <p>
              "There are no refunds because you can already evaluate "
              <b>"Mint UI"</b>
              " UI before using it commercially."
            </p>

            <h3>"Can we cancel / get a receipt?"</h3>

            <p>
              "Our payment handler Gumroad allows you to do all of thes" \
              "e without having to contact a human."
            </p>

            <h3>"What payment methods are accepted?"</h3>
            <p>"All major credit cards are accepted using Gumroad."</p>

            <h3>"I still have questions!"</h3>

            <p>
              <a
                href="mailto:gusztav.szikszai@gmail.com"
                target="_blank">

                "Contact us"

              </a>
            </p>
          </div>
        </div>
      </Ui.Content>
    </div>
  }
}
