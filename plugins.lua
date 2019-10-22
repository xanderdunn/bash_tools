local iron = require('iron')

iron.core.add_repl_definitions {
  python = {
    mycustom = {
      command = {"ipython", "repl", ":connect"}
    }
  }
}

iron.core.set_config {
  preferred = {
    python = "ipython"
  }
}
