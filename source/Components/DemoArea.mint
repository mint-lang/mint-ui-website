component DemoArea {
  property children : Array(Html) = []

  style base {
    background: linear-gradient(45deg, var(--checker-color-1) 25%, transparent 25%, transparent 75%, var(--checker-color-1) 75%, var(--checker-color-1)),
                linear-gradient(45deg, var(--checker-color-1) 25%, transparent 25%, transparent 75%, var(--checker-color-1) 75%, var(--checker-color-1));

    background-position: 0 0, 0.625em 0.625em;
    background-color: var(--checker-color-2);
    background-size: 1.25em 1.25em;

    justify-content: center;
    align-items: center;
    display: flex;

    min-height: 5em;
    padding: 1em;
  }

  fun render : Html {
    <div::base>
      <{ children }>
    </div>
  }
}
