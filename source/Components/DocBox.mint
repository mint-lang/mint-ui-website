component DocBox {
  property content : Html = <></>
  property example : Html = <></>
  property title : String = ""
  property hint : Html = <></>

  style base {
    grid-gap: 0.5em;
    display: grid;
  }

  style anchor {
    display: block;
    font-size: 0;
    height: 0;
  }

  style title {
    justify-content: start;
    grid-auto-flow: column;
    align-items: center;
    grid-gap: 0.5em;
    display: grid;

    a {
      outline: none;
      opacity: 0.5;

      svg {
        transform: rotate(-45deg) translateY(5px);
      }

      &:hover,
      &:focus {
        opacity: 1;
      }
    }
  }

  fun render {
    <div>
      if String.isNotBlank(title) {
        <a::anchor
          name={String.parameterize(title)}
          aria-hidden="true">

          <{ title }>

        </a>
      }

      <div::base>
        <Ui.Box
          title={
            <div::title>
              <{ title }>

              <span title="Permalink to #{title}">
                <Ui.Icon
                  href="##{String.parameterize(title)}"
                  icon={Ui.Icons:LINK}/>
              </span>
            </div>
          }>

          <{ content }>

        </Ui.Box>

        <{ hint }>
        <{ example }>
      </div>
    </div>
  }
}
