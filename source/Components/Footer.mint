component Footer {
  style infos {
    max-width: 500px;
  }

  style copyright {
    opacity: 0.5;
  }

  fun render : Html {
    try {
      navitems =
        [
          {
            "Site",
            [
              NavItems:HOME,
              NavItems:INSTALL,
              NavItems:COMPONENTS,
              NavItems:DOCUMENTATION,
              NavItems:EXAMPLES
            ]
          },
          {
            "Community",
            [
              NavItems:GITTER,
              NavItems:DISCORD,
              NavItems:TELEGRAM,
              NavItems:TWITTER
            ]
          },
          {
            "Source",
            [
              NavItems:SOURCE,
              NavItems:WEBSITE_SOURCE,
              NavItems:RELEASES
            ]
          }
        ]

      infos =
        <div::infos>
          <Logo size={Ui.Size::Em(2)}/>

          <p>
            "Mint UI is a design system and component library for bui" \
            "lding websites, web and desktop applications."
          </p>

          <div::copyright>
            "Copyright © #{Time.year(Time.now())} Szikszai Gusztáv. A" \
            "ll rights reserved."
          </div>
        </div>

      <Ui.Footer
        categoryWhiteSpace="nowrap"
        navitems={navitems}
        infos={infos}/>
    }
  }
}
