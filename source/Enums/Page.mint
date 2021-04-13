/* Represents a page in the website. */
enum Page {
  /* A full page example. */
  Example(String, Html)

  /* The list of examples. */
  Examples

  /* A documentation page. */
  Documentation(String, Html)

  /* A component page. */
  Component(Component)

  /* The the fallback page. */
  NotFound

  /* The initial page. */
  Initial

  /* The home page. */
  Home
}
