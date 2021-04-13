/* Represents a property from the documentation. */
record Documentation.Property {
  description : Maybe(String),
  default : Maybe(String),
  type : Maybe(String),
  name : String
}

/* Represents a components documentation. */
record Documentation {
  properties : Array(Documentation.Property),
  name : String
}
