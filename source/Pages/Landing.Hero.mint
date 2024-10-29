component Pages.Landing.Hero {
  connect Ui exposing { mobile, darkMode }

  style base {
    background-size: 100% 100%, calc(10 * 1.5px) calc(10 * 1.5px);

    font-size: min(18px, 1vw);
    position: relative;
    min-height: 80vh;

    grid-template-columns: 1fr min(800px, 60vw);
    align-items: center;
    grid-gap: 4em;
    display: grid;

    if darkMode {
      background-image: radial-gradient(ellipse closest-side, transparent, var(--background-color)),
                        radial-gradient(#333 1.5px, transparent 1.5px);
    } else {
      background-image: radial-gradient(ellipse closest-side, transparent, var(--background-color)),
                        radial-gradient(#D9D9D9 1.5px, transparent 1.5px);
    }

    if mobile {
      grid-template-columns: 1fr;
      align-self: start;
      grid-gap: 1em;

      font-size: 14px;
    }
  }

  style title {
    font-family: Nunito;
    line-height: 1.2;
    font-weight: 800;
    font-size: 2.5em;

    if darkMode {
      color: #EEE;
    } else {
      color: #222;
    }

    @media (max-width: 1000px) {
      font-size: 1.5em;
    }
  }

  style actions {
    justify-content: start;
    grid-auto-flow: column;
    grid-gap: 1em;
    display: grid;

    font-size: 1em;

    if mobile {
      justify-content: stretch;
      grid-auto-flow: row;
      grid-gap: 0.5em;
    }
  }

  style infos {
    justify-content: center;
    flex-direction: column;
    display: flex;
  }

  style example {
    font-size: 0.88888em;
    align-items: center;
    display: grid;
    flex: 0 0 60%;
  }

  style subtitle {
    margin-bottom: 2em;
    margin-top: 1.5em;
    font-size: 1em;
  }

  style item {
    grid-auto-flow: column;
    justify-content: start;
    grid-gap: 0.7em;
    display: grid;
  }

  fun render {
    <div::base>
      <div::infos>
        <div::title>
          "Beautiful, Reliable"
          <br/>
          "Components for Mint"
        </div>

        <div::subtitle>
          <Ui.Content>
            <p>
              "Have you ever wanted to create stunning "
              <b>"single page applications"</b>
              "?"
            </p>

            <p>
              "Whether you are a beginner or a more advanced developer, "
              <b>"Mint UI"</b>
              " is the "
              <b>"component library"</b>
              " you need to use to create something amazing."
            </p>

            <ul>
              <li>"60+ ready to use, hand crafted components."</li>
              <li>"Themable with CSS variables."</li>
              <li>"Fully responsive."</li>
              <li>"Data driven."</li>
            </ul>
          </Ui.Content>
        </div>

        <div::actions>
          <Ui.Button
            iconBefore={Ui.Icons.PUZZLE}
            label="Browse Components"
            href="/components"
          />

          <Ui.Button
            iconBefore={Ui.Icons.TELESCOPE}
            label="Explore Examples"
            href="/examples"
            type="secondary"
          />
        </div>
      </div>

      <div::example><Pages.Landing.Example/></div>
    </div>
  }
}
