component Page.NotFound {
  connect Ui exposing { mobile }

  style base {
    place-content: center;
    display: grid;

    if (mobile) {
      min-height: auto;
      padding: 2em 0;
    } else {
      min-height: 80vh;
    }
  }

  style hr {
    margin-top: 1em;

    border: 0;
    border-top: 0.1825em solid var(--content-border);
  }

  fun render : Html {
    <>
      <div::hr/>

      <div::base>
        <Ui.IllustratedMessage
          subtitle=<{ "The page you were looking for does not exist!" }>
          title=<{ "404 NOT FOUND!" }>
          image=<{
            <Ui.Icon
              icon={@svg(../../assets/svgs/map.svg)}
              size={Ui.Size::Em(10)}/>
          }>
          actions=<{
            <Ui.Button
              iconBefore={Ui.Icons:PUZZLE}
              label="Browse Components"
              href="/components"/>

            <Ui.Button
              iconBefore={Ui.Icons:TELESCOPE}
              label="Explore Examples"
              href="/examples"
              type="secondary"/>
          }>/>
      </div>
    </>
  }
}
