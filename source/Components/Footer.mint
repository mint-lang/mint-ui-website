component Footer {
  style infos {
    max-width: 500px;
  }

  style copyright {
    opacity: 0.5;
  }

  fun render : Html {
    let navitems =
      [
        {
          "Site",
          [
            NavItems.HOME,
            NavItems.INSTALL,
            NavItems.COMPONENTS,
            NavItems.DOCUMENTATION,
            NavItems.PRICING,
            NavItems.EXAMPLES
          ]
        },
        {
          "Community",
          [
            NavItems.GITTER,
            NavItems.DISCORD,
            NavItems.TELEGRAM,
            NavItems.TWITTER
          ]
        },
        {
          "Source",
          [NavItems.SOURCE, NavItems.WEBSITE_SOURCE, NavItems.RELEASES]
        }
      ]

    let infos =
      <div::infos>
        <Logo size={Ui.Size.Em(2)}/>

        <p>
          "Mint UI is a design system and component library for building " \
          "websites, web and desktop applications."
        </p>

        <div::copyright>
          "Copyright © 2018-#{Time.year(Time.now())} Szikszai Gusztáv. All " \
          "rights reserved."
        </div>
      </div>

    <Ui.Footer categoryWhiteSpace="nowrap" navitems={navitems} infos={infos}/>
  }
}
