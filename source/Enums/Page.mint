/* Represents a page in the website. */
type Page {
  /* A full page example. */
  Example(String, Html)

  /* The list of examples. */
  Examples

  /* A documentation page. */
  Documentation(String, Html)

  /* A component page. */
  Component(Component)

  /* The fallback page. */
  NotFound

  /* The pricing page. */
  Pricing

  /* The initial page. */
  Initial

  /* The home page. */
  Home
}
